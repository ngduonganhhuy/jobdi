import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobdi/domain/entities/auth_entity.dart' show AuthEntity;

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial({
    @Default(5) int retryRemaining,
    @Default(300) int secondRemainingToWait,
  }) = AuthInitial;

  const factory AuthState.failed({
    required String message,
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = AuthFailed;

  const factory AuthState.success({
    required AuthEntity authEntity,
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = AuthSuccess;

  const factory AuthState.showNotificationNoticed({
    int? retryRemaining,
    int? secondRemainingToWait,
  }) = ShowNotificationNoticed;
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
