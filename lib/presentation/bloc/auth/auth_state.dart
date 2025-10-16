import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobdi/domain/entities/auth_entity.dart' show AuthEntity;

part 'auth_state.freezed.dart';

@Freezed(copyWith: true)
sealed class AuthState with _$AuthState {
  const factory AuthState.initial({
    @Default(5) int retryRemaining,
    @Default(300) int secondRemaingToWait,
  }) = AuthInitial;

  const factory AuthState.failed({
    required String message,
    @Default(5) int retryRemaining,
    @Default(300) int secondRemaingToWait,
  }) = AuthFailed;

  const factory AuthState.success({
    required AuthEntity authEntity,
    @Default(5) int retryRemaining,
    @Default(300) int secondRemaingToWait,
  }) = AuthSuccess;

  const factory AuthState.showNotificationNoticed({
    @Default(5) int retryRemaining,
    @Default(300) int secondRemaingToWait,
  }) = ShowNotificationNoticed;
}

extension AuthStateX on AuthState {
  AuthState keepDataFrom(AuthState old) => map(
    initial: (s) => s.copyWith(
      retryRemaining: old.retryRemaining,
      secondRemaingToWait: old.secondRemaingToWait,
    ),
    failed: (s) => s.copyWith(
      retryRemaining: old.retryRemaining,
      secondRemaingToWait: old.secondRemaingToWait,
    ),
    success: (s) => s.copyWith(
      retryRemaining: old.retryRemaining,
      secondRemaingToWait: old.secondRemaingToWait,
    ),
    showNotificationNoticed: (s) => s.copyWith(
      retryRemaining: old.retryRemaining,
      secondRemaingToWait: old.secondRemaingToWait,
    ),
  );
}
