part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String username,
    required String password,
  }) = _AuthSignInRequested;

  const factory AuthEvent.otpValidatorFailed() = _OTPValidatorFailed;

  const factory AuthEvent.checkShowNotificationIfNeeded() =
      _CheckShowNotificationIfNeeded;

  const factory AuthEvent.updateSecondRemaingToWait(int second) =
      _UpdateSecondRemaingToWait;
}
