part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial({
    @Default(5) int retryRemaining,
    @Default(300) int secondRemainingToWait,
  }) = _AuthInitial;

  const factory AuthState.failed({
    required String message,
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = _AuthFailed;

  const factory AuthState.success({
    AuthEntity? authEntity,
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = _AuthSuccess;

  const factory AuthState.showNotificationNoticed({
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = _ShowNotificationNoticed;
}

extension AuthStateX on AuthState {
  AuthState keepDataFrom(AuthState old) => map(
    initial: (s) => s.copyWith(
      retryRemaining: s.retryRemaining,
      secondRemainingToWait: s.secondRemainingToWait,
    ),
    failed: (s) => s.copyWith(
      retryRemaining: s.retryRemaining ?? old.retryRemaining,
      secondRemainingToWait:
          s.secondRemainingToWait ?? old.secondRemainingToWait,
    ),
    success: (s) => s.copyWith(
      retryRemaining: s.retryRemaining ?? old.retryRemaining,
      secondRemainingToWait:
          s.secondRemainingToWait ?? old.secondRemainingToWait,
    ),
    showNotificationNoticed: (s) => s.copyWith(
      retryRemaining: s.retryRemaining ?? old.retryRemaining,
      secondRemainingToWait:
          s.secondRemainingToWait ?? old.secondRemainingToWait,
    ),
  );
}
