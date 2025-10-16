import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String username,
    required String password,
  }) = AuthSignInRequested;

  const factory AuthEvent.otpValidatorFailed() = OTPValidatorFailed;

  const factory AuthEvent.checkShowNotificationIfNeeded() =
      CheckShowNotificationIfNeeded;

  const factory AuthEvent.updateSecondRemaingToWait(int second) =
      UpdateSecondRemaingToWait;
}
