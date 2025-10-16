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
    show AuthInitial, AuthState, AuthStateX;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUseCase) : super(const AuthInitial()) {
    on<AuthSignInRequested>(signIn);
    on<OTPValidatorFailed>(onValidateOtpFailed);
    on<CheckShowNotificationIfNeeded>(checkShowNotificationIfNeeded);
    on<UpdateSecondRemaingToWait>(updateSecondRemaingToWait);
  }
  final LoginUseCase loginUseCase;

  void updateSecondRemaingToWait(
    UpdateSecondRemaingToWait event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(secondRemaingToWait: event.second));
  }

  void checkShowNotificationIfNeeded(
    CheckShowNotificationIfNeeded event,
    Emitter<AuthState> emit,
  ) {
    if (state.retryRemaining <= 0 || state.secondRemaingToWait > 0) {
      emit(const AuthState.showNotificationNoticed().keepDataFrom(state));
    }
  }

  void onValidateOtpFailed(OTPValidatorFailed event, Emitter<AuthState> emit) {
    if (state.retryRemaining > 0) {
      emit(state.copyWith(retryRemaining: state.retryRemaining - 1));
    }
    if (state.retryRemaining <= 0) {
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
        emit(AuthState.success(authEntity: response.data!));
      } else {
        emit(AuthState.failed(message: response.error?.message ?? ''));
      }
    } on Exception catch (e) {
      emit(AuthState.failed(message: e.toString()));
    }
  }
}
