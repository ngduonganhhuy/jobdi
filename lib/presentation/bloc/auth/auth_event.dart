part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested(this.username, this.password);
  final String username;
  final String password;

   @override
  List<Object> get props => [username, password];
}
