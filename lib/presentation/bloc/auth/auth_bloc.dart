import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobdi/core/impl/result_response.dart';
import 'package:jobdi/domain/entities/auth_entity.dart';
import 'package:jobdi/domain/usecases/auth/login_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUseCase) : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {});
  }
  final LoginUseCase loginUseCase;

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
        emit(AuthSuccess(response.data!));
      } else {
        emit(AuthFailed(response.error?.message ?? ''));
      }
    } on Exception catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
