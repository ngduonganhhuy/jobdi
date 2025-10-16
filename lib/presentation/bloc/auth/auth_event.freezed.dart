// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthSignInRequested value)?  signInRequested,TResult Function( OTPValidatorFailed value)?  otpValidatorFailed,TResult Function( CheckShowNotificationIfNeeded value)?  checkShowNotificationIfNeeded,TResult Function( UpdateSecondRemaingToWait value)?  updateSecondRemaingToWait,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthSignInRequested() when signInRequested != null:
return signInRequested(_that);case OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed(_that);case CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded(_that);case UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
return updateSecondRemaingToWait(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthSignInRequested value)  signInRequested,required TResult Function( OTPValidatorFailed value)  otpValidatorFailed,required TResult Function( CheckShowNotificationIfNeeded value)  checkShowNotificationIfNeeded,required TResult Function( UpdateSecondRemaingToWait value)  updateSecondRemaingToWait,}){
final _that = this;
switch (_that) {
case AuthSignInRequested():
return signInRequested(_that);case OTPValidatorFailed():
return otpValidatorFailed(_that);case CheckShowNotificationIfNeeded():
return checkShowNotificationIfNeeded(_that);case UpdateSecondRemaingToWait():
return updateSecondRemaingToWait(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthSignInRequested value)?  signInRequested,TResult? Function( OTPValidatorFailed value)?  otpValidatorFailed,TResult? Function( CheckShowNotificationIfNeeded value)?  checkShowNotificationIfNeeded,TResult? Function( UpdateSecondRemaingToWait value)?  updateSecondRemaingToWait,}){
final _that = this;
switch (_that) {
case AuthSignInRequested() when signInRequested != null:
return signInRequested(_that);case OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed(_that);case CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded(_that);case UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
return updateSecondRemaingToWait(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String username,  String password)?  signInRequested,TResult Function()?  otpValidatorFailed,TResult Function()?  checkShowNotificationIfNeeded,TResult Function( int second)?  updateSecondRemaingToWait,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthSignInRequested() when signInRequested != null:
return signInRequested(_that.username,_that.password);case OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed();case CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded();case UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
return updateSecondRemaingToWait(_that.second);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String username,  String password)  signInRequested,required TResult Function()  otpValidatorFailed,required TResult Function()  checkShowNotificationIfNeeded,required TResult Function( int second)  updateSecondRemaingToWait,}) {final _that = this;
switch (_that) {
case AuthSignInRequested():
return signInRequested(_that.username,_that.password);case OTPValidatorFailed():
return otpValidatorFailed();case CheckShowNotificationIfNeeded():
return checkShowNotificationIfNeeded();case UpdateSecondRemaingToWait():
return updateSecondRemaingToWait(_that.second);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String username,  String password)?  signInRequested,TResult? Function()?  otpValidatorFailed,TResult? Function()?  checkShowNotificationIfNeeded,TResult? Function( int second)?  updateSecondRemaingToWait,}) {final _that = this;
switch (_that) {
case AuthSignInRequested() when signInRequested != null:
return signInRequested(_that.username,_that.password);case OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed();case CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded();case UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
return updateSecondRemaingToWait(_that.second);case _:
  return null;

}
}

}

/// @nodoc


class AuthSignInRequested implements AuthEvent {
  const AuthSignInRequested({required this.username, required this.password});
  

 final  String username;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSignInRequestedCopyWith<AuthSignInRequested> get copyWith => _$AuthSignInRequestedCopyWithImpl<AuthSignInRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSignInRequested&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthEvent.signInRequested(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthSignInRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSignInRequestedCopyWith(AuthSignInRequested value, $Res Function(AuthSignInRequested) _then) = _$AuthSignInRequestedCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$AuthSignInRequestedCopyWithImpl<$Res>
    implements $AuthSignInRequestedCopyWith<$Res> {
  _$AuthSignInRequestedCopyWithImpl(this._self, this._then);

  final AuthSignInRequested _self;
  final $Res Function(AuthSignInRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(AuthSignInRequested(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OTPValidatorFailed implements AuthEvent {
  const OTPValidatorFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OTPValidatorFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.otpValidatorFailed()';
}


}




/// @nodoc


class CheckShowNotificationIfNeeded implements AuthEvent {
  const CheckShowNotificationIfNeeded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckShowNotificationIfNeeded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkShowNotificationIfNeeded()';
}


}




/// @nodoc


class UpdateSecondRemaingToWait implements AuthEvent {
  const UpdateSecondRemaingToWait(this.second);
  

 final  int second;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSecondRemaingToWaitCopyWith<UpdateSecondRemaingToWait> get copyWith => _$UpdateSecondRemaingToWaitCopyWithImpl<UpdateSecondRemaingToWait>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSecondRemaingToWait&&(identical(other.second, second) || other.second == second));
}


@override
int get hashCode => Object.hash(runtimeType,second);

@override
String toString() {
  return 'AuthEvent.updateSecondRemaingToWait(second: $second)';
}


}

/// @nodoc
abstract mixin class $UpdateSecondRemaingToWaitCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $UpdateSecondRemaingToWaitCopyWith(UpdateSecondRemaingToWait value, $Res Function(UpdateSecondRemaingToWait) _then) = _$UpdateSecondRemaingToWaitCopyWithImpl;
@useResult
$Res call({
 int second
});




}
/// @nodoc
class _$UpdateSecondRemaingToWaitCopyWithImpl<$Res>
    implements $UpdateSecondRemaingToWaitCopyWith<$Res> {
  _$UpdateSecondRemaingToWaitCopyWithImpl(this._self, this._then);

  final UpdateSecondRemaingToWait _self;
  final $Res Function(UpdateSecondRemaingToWait) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? second = null,}) {
  return _then(UpdateSecondRemaingToWait(
null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
