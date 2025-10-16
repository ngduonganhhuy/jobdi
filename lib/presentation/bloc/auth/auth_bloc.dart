import 'dart:async' show Timer;

import 'package:bloc/bloc.dart';
import 'package:jobdi/core/impl/result_response.dart';
import 'package:jobdi/domain/usecases/auth/login_use_case.dart';
import 'package:jobdi/presentation/bloc/auth/auth_event.dart'
    show
        AuthEvent,
        AuthSignInRequested,
        CheckShowNotificationIfNeeded,
        OTPValidatorFailed,
        UpdateSecondRemaingToWait;
import 'package:jobdi/presentation/bloc/auth/auth_state.dart'
    show AuthInitial, AuthState, AuthStateX, ShowNotificationNoticed;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUseCase) : super(const AuthInitial()) {
    on<AuthSignInRequested>(signIn);
    on<OTPValidatorFailed>(onValidateOtpFailed);
    on<CheckShowNotificationIfNeeded>(checkShowNotificationIfNeeded);
    on<UpdateSecondRemaingToWait>(updateSecondRemaingToWait);
  }
  final LoginUseCase loginUseCase;
  Timer? _cooldownTimer;
  AuthState? _lastNonNoticeState;

  void startCooldownTimer(int seconds) {
    _cooldownTimer?.cancel();

    add(UpdateSecondRemaingToWait(seconds));

    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final nextSecond = seconds - timer.tick;
      if (nextSecond <= 0) {
        timer.cancel();
        add(const UpdateSecondRemaingToWait(0));
      } else {
        add(UpdateSecondRemaingToWait(nextSecond));
      }
    });
  }

  void updateSecondRemaingToWait(
    UpdateSecondRemaingToWait event,
    Emitter<AuthState> emit,
  ) {
    final isNotice = state is ShowNotificationNoticed;
    if (event.second <= 0) {
      emit(
        state.copyWith(
          retryRemaining: 5,
          secondRemainingToWait: 300,
        ),
      );
      return;
    }
    if (isNotice) {
      final base = _lastNonNoticeState ?? state;
      final updated = base.copyWith(secondRemainingToWait: event.second);
      _lastNonNoticeState = updated;
      emit(updated);
      return;
    }

    final updated = state.copyWith(secondRemainingToWait: event.second);
    _lastNonNoticeState = updated;
    emit(updated);
  }

  void checkShowNotificationIfNeeded(
    CheckShowNotificationIfNeeded event,
    Emitter<AuthState> emit,
  ) {
    if (state.retryRemaining == null || state.secondRemainingToWait == null) {
      return;
    }
    if (state.retryRemaining! <= 0 && state.secondRemainingToWait! > 0) {
      _lastNonNoticeState = state;
      emit(const AuthState.showNotificationNoticed().keepDataFrom(state));
    }
  }

  void onValidateOtpFailed(OTPValidatorFailed event, Emitter<AuthState> emit) {
    if (state.retryRemaining == null || state.secondRemainingToWait == null) {
      return;
    }
    if (state.retryRemaining! > 0) {
      final updated = state.copyWith(retryRemaining: state.retryRemaining! - 1);
      _lastNonNoticeState = updated;
      emit(updated);
    }
    if (state.retryRemaining! <= 0) {
      _lastNonNoticeState = state;
      emit(const AuthState.showNotificationNoticed().keepDataFrom(state));
    }
  }

  Future<void> signIn(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final response = await loginUseCase.revoke(
        event.username,
        event.password,
      );
      if (response.status == ResultStatus.success && response.data != null) {
        final success = AuthState.success(authEntity: response.data!);
        _lastNonNoticeState = success;
        emit(success);
      } else {
        final failed = AuthState.failed(message: response.error?.message ?? '');
        _lastNonNoticeState = failed;
        emit(failed);
      }
    } on Exception catch (e) {
      final failed = AuthState.failed(message: e.toString());
      _lastNonNoticeState = failed;
      emit(failed);
    }
  }
}
