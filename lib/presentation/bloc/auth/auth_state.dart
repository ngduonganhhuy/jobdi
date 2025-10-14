part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthFailed extends AuthState {
  const AuthFailed(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

final class AuthSuccess extends AuthState {
  const AuthSuccess(this.authEntity);
  final AuthEntity authEntity;

  @override
  List<Object> get props => [authEntity];
}
