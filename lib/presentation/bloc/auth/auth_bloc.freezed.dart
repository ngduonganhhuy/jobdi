// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthSignInRequested value)?  signInRequested,TResult Function( _OTPValidatorFailed value)?  otpValidatorFailed,TResult Function( _CheckShowNotificationIfNeeded value)?  checkShowNotificationIfNeeded,TResult Function( _UpdateSecondRemaingToWait value)?  updateSecondRemaingToWait,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSignInRequested() when signInRequested != null:
return signInRequested(_that);case _OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed(_that);case _CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded(_that);case _UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthSignInRequested value)  signInRequested,required TResult Function( _OTPValidatorFailed value)  otpValidatorFailed,required TResult Function( _CheckShowNotificationIfNeeded value)  checkShowNotificationIfNeeded,required TResult Function( _UpdateSecondRemaingToWait value)  updateSecondRemaingToWait,}){
final _that = this;
switch (_that) {
case _AuthSignInRequested():
return signInRequested(_that);case _OTPValidatorFailed():
return otpValidatorFailed(_that);case _CheckShowNotificationIfNeeded():
return checkShowNotificationIfNeeded(_that);case _UpdateSecondRemaingToWait():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthSignInRequested value)?  signInRequested,TResult? Function( _OTPValidatorFailed value)?  otpValidatorFailed,TResult? Function( _CheckShowNotificationIfNeeded value)?  checkShowNotificationIfNeeded,TResult? Function( _UpdateSecondRemaingToWait value)?  updateSecondRemaingToWait,}){
final _that = this;
switch (_that) {
case _AuthSignInRequested() when signInRequested != null:
return signInRequested(_that);case _OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed(_that);case _CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded(_that);case _UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
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
case _AuthSignInRequested() when signInRequested != null:
return signInRequested(_that.username,_that.password);case _OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed();case _CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded();case _UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
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
case _AuthSignInRequested():
return signInRequested(_that.username,_that.password);case _OTPValidatorFailed():
return otpValidatorFailed();case _CheckShowNotificationIfNeeded():
return checkShowNotificationIfNeeded();case _UpdateSecondRemaingToWait():
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
case _AuthSignInRequested() when signInRequested != null:
return signInRequested(_that.username,_that.password);case _OTPValidatorFailed() when otpValidatorFailed != null:
return otpValidatorFailed();case _CheckShowNotificationIfNeeded() when checkShowNotificationIfNeeded != null:
return checkShowNotificationIfNeeded();case _UpdateSecondRemaingToWait() when updateSecondRemaingToWait != null:
return updateSecondRemaingToWait(_that.second);case _:
  return null;

}
}

}

/// @nodoc


class _AuthSignInRequested implements AuthEvent {
  const _AuthSignInRequested({required this.username, required this.password});
  

 final  String username;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSignInRequestedCopyWith<_AuthSignInRequested> get copyWith => __$AuthSignInRequestedCopyWithImpl<_AuthSignInRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSignInRequested&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'AuthEvent.signInRequested(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthSignInRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AuthSignInRequestedCopyWith(_AuthSignInRequested value, $Res Function(_AuthSignInRequested) _then) = __$AuthSignInRequestedCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class __$AuthSignInRequestedCopyWithImpl<$Res>
    implements _$AuthSignInRequestedCopyWith<$Res> {
  __$AuthSignInRequestedCopyWithImpl(this._self, this._then);

  final _AuthSignInRequested _self;
  final $Res Function(_AuthSignInRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_AuthSignInRequested(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OTPValidatorFailed implements AuthEvent {
  const _OTPValidatorFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OTPValidatorFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.otpValidatorFailed()';
}


}




/// @nodoc


class _CheckShowNotificationIfNeeded implements AuthEvent {
  const _CheckShowNotificationIfNeeded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckShowNotificationIfNeeded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkShowNotificationIfNeeded()';
}


}




/// @nodoc


class _UpdateSecondRemaingToWait implements AuthEvent {
  const _UpdateSecondRemaingToWait(this.second);
  

 final  int second;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSecondRemaingToWaitCopyWith<_UpdateSecondRemaingToWait> get copyWith => __$UpdateSecondRemaingToWaitCopyWithImpl<_UpdateSecondRemaingToWait>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSecondRemaingToWait&&(identical(other.second, second) || other.second == second));
}


@override
int get hashCode => Object.hash(runtimeType,second);

@override
String toString() {
  return 'AuthEvent.updateSecondRemaingToWait(second: $second)';
}


}

/// @nodoc
abstract mixin class _$UpdateSecondRemaingToWaitCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$UpdateSecondRemaingToWaitCopyWith(_UpdateSecondRemaingToWait value, $Res Function(_UpdateSecondRemaingToWait) _then) = __$UpdateSecondRemaingToWaitCopyWithImpl;
@useResult
$Res call({
 int second
});




}
/// @nodoc
class __$UpdateSecondRemaingToWaitCopyWithImpl<$Res>
    implements _$UpdateSecondRemaingToWaitCopyWith<$Res> {
  __$UpdateSecondRemaingToWaitCopyWithImpl(this._self, this._then);

  final _UpdateSecondRemaingToWait _self;
  final $Res Function(_UpdateSecondRemaingToWait) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? second = null,}) {
  return _then(_UpdateSecondRemaingToWait(
null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AuthState {

 int? get retryRemaining; int? get secondRemainingToWait;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemainingToWait, secondRemainingToWait) || other.secondRemainingToWait == secondRemainingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemainingToWait);

@override
String toString() {
  return 'AuthState(retryRemaining: $retryRemaining, secondRemainingToWait: $secondRemainingToWait)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 int retryRemaining, int secondRemainingToWait
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retryRemaining = null,Object? secondRemainingToWait = null,}) {
  return _then(_self.copyWith(
retryRemaining: null == retryRemaining ? _self.retryRemaining! : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemainingToWait: null == secondRemainingToWait ? _self.secondRemainingToWait! : secondRemainingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthInitial value)?  initial,TResult Function( _AuthFailed value)?  failed,TResult Function( _AuthSuccess value)?  success,TResult Function( _ShowNotificationNoticed value)?  showNotificationNoticed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthFailed() when failed != null:
return failed(_that);case _AuthSuccess() when success != null:
return success(_that);case _ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthInitial value)  initial,required TResult Function( _AuthFailed value)  failed,required TResult Function( _AuthSuccess value)  success,required TResult Function( _ShowNotificationNoticed value)  showNotificationNoticed,}){
final _that = this;
switch (_that) {
case _AuthInitial():
return initial(_that);case _AuthFailed():
return failed(_that);case _AuthSuccess():
return success(_that);case _ShowNotificationNoticed():
return showNotificationNoticed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthInitial value)?  initial,TResult? Function( _AuthFailed value)?  failed,TResult? Function( _AuthSuccess value)?  success,TResult? Function( _ShowNotificationNoticed value)?  showNotificationNoticed,}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthFailed() when failed != null:
return failed(_that);case _AuthSuccess() when success != null:
return success(_that);case _ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int retryRemaining,  int secondRemainingToWait)?  initial,TResult Function( String message,  int? retryRemaining,  int? secondRemainingToWait)?  failed,TResult Function( AuthEntity? authEntity,  int? retryRemaining,  int? secondRemainingToWait)?  success,TResult Function( int? retryRemaining,  int? secondRemainingToWait)?  showNotificationNoticed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that.retryRemaining,_that.secondRemainingToWait);case _AuthFailed() when failed != null:
return failed(_that.message,_that.retryRemaining,_that.secondRemainingToWait);case _AuthSuccess() when success != null:
return success(_that.authEntity,_that.retryRemaining,_that.secondRemainingToWait);case _ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that.retryRemaining,_that.secondRemainingToWait);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int retryRemaining,  int secondRemainingToWait)  initial,required TResult Function( String message,  int? retryRemaining,  int? secondRemainingToWait)  failed,required TResult Function( AuthEntity? authEntity,  int? retryRemaining,  int? secondRemainingToWait)  success,required TResult Function( int? retryRemaining,  int? secondRemainingToWait)  showNotificationNoticed,}) {final _that = this;
switch (_that) {
case _AuthInitial():
return initial(_that.retryRemaining,_that.secondRemainingToWait);case _AuthFailed():
return failed(_that.message,_that.retryRemaining,_that.secondRemainingToWait);case _AuthSuccess():
return success(_that.authEntity,_that.retryRemaining,_that.secondRemainingToWait);case _ShowNotificationNoticed():
return showNotificationNoticed(_that.retryRemaining,_that.secondRemainingToWait);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int retryRemaining,  int secondRemainingToWait)?  initial,TResult? Function( String message,  int? retryRemaining,  int? secondRemainingToWait)?  failed,TResult? Function( AuthEntity? authEntity,  int? retryRemaining,  int? secondRemainingToWait)?  success,TResult? Function( int? retryRemaining,  int? secondRemainingToWait)?  showNotificationNoticed,}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that.retryRemaining,_that.secondRemainingToWait);case _AuthFailed() when failed != null:
return failed(_that.message,_that.retryRemaining,_that.secondRemainingToWait);case _AuthSuccess() when success != null:
return success(_that.authEntity,_that.retryRemaining,_that.secondRemainingToWait);case _ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that.retryRemaining,_that.secondRemainingToWait);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInitial implements AuthState {
  const _AuthInitial({this.retryRemaining = 5, this.secondRemainingToWait = 300});
  

@override@JsonKey() final  int retryRemaining;
@override@JsonKey() final  int secondRemainingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthInitialCopyWith<_AuthInitial> get copyWith => __$AuthInitialCopyWithImpl<_AuthInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInitial&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemainingToWait, secondRemainingToWait) || other.secondRemainingToWait == secondRemainingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemainingToWait);

@override
String toString() {
  return 'AuthState.initial(retryRemaining: $retryRemaining, secondRemainingToWait: $secondRemainingToWait)';
}


}

/// @nodoc
abstract mixin class _$AuthInitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthInitialCopyWith(_AuthInitial value, $Res Function(_AuthInitial) _then) = __$AuthInitialCopyWithImpl;
@override @useResult
$Res call({
 int retryRemaining, int secondRemainingToWait
});




}
/// @nodoc
class __$AuthInitialCopyWithImpl<$Res>
    implements _$AuthInitialCopyWith<$Res> {
  __$AuthInitialCopyWithImpl(this._self, this._then);

  final _AuthInitial _self;
  final $Res Function(_AuthInitial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryRemaining = null,Object? secondRemainingToWait = null,}) {
  return _then(_AuthInitial(
retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemainingToWait: null == secondRemainingToWait ? _self.secondRemainingToWait : secondRemainingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AuthFailed implements AuthState {
  const _AuthFailed({required this.message, this.retryRemaining, this.secondRemainingToWait});
  

 final  String message;
@override final  int? retryRemaining;
@override final  int? secondRemainingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFailedCopyWith<_AuthFailed> get copyWith => __$AuthFailedCopyWithImpl<_AuthFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFailed&&(identical(other.message, message) || other.message == message)&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemainingToWait, secondRemainingToWait) || other.secondRemainingToWait == secondRemainingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,message,retryRemaining,secondRemainingToWait);

@override
String toString() {
  return 'AuthState.failed(message: $message, retryRemaining: $retryRemaining, secondRemainingToWait: $secondRemainingToWait)';
}


}

/// @nodoc
abstract mixin class _$AuthFailedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthFailedCopyWith(_AuthFailed value, $Res Function(_AuthFailed) _then) = __$AuthFailedCopyWithImpl;
@override @useResult
$Res call({
 String message, int? retryRemaining, int? secondRemainingToWait
});




}
/// @nodoc
class __$AuthFailedCopyWithImpl<$Res>
    implements _$AuthFailedCopyWith<$Res> {
  __$AuthFailedCopyWithImpl(this._self, this._then);

  final _AuthFailed _self;
  final $Res Function(_AuthFailed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? retryRemaining = freezed,Object? secondRemainingToWait = freezed,}) {
  return _then(_AuthFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryRemaining: freezed == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int?,secondRemainingToWait: freezed == secondRemainingToWait ? _self.secondRemainingToWait : secondRemainingToWait // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _AuthSuccess implements AuthState {
  const _AuthSuccess({this.authEntity, this.retryRemaining, this.secondRemainingToWait});
  

 final  AuthEntity? authEntity;
@override final  int? retryRemaining;
@override final  int? secondRemainingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSuccessCopyWith<_AuthSuccess> get copyWith => __$AuthSuccessCopyWithImpl<_AuthSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSuccess&&(identical(other.authEntity, authEntity) || other.authEntity == authEntity)&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemainingToWait, secondRemainingToWait) || other.secondRemainingToWait == secondRemainingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,authEntity,retryRemaining,secondRemainingToWait);

@override
String toString() {
  return 'AuthState.success(authEntity: $authEntity, retryRemaining: $retryRemaining, secondRemainingToWait: $secondRemainingToWait)';
}


}

/// @nodoc
abstract mixin class _$AuthSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthSuccessCopyWith(_AuthSuccess value, $Res Function(_AuthSuccess) _then) = __$AuthSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthEntity? authEntity, int? retryRemaining, int? secondRemainingToWait
});




}
/// @nodoc
class __$AuthSuccessCopyWithImpl<$Res>
    implements _$AuthSuccessCopyWith<$Res> {
  __$AuthSuccessCopyWithImpl(this._self, this._then);

  final _AuthSuccess _self;
  final $Res Function(_AuthSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authEntity = freezed,Object? retryRemaining = freezed,Object? secondRemainingToWait = freezed,}) {
  return _then(_AuthSuccess(
authEntity: freezed == authEntity ? _self.authEntity : authEntity // ignore: cast_nullable_to_non_nullable
as AuthEntity?,retryRemaining: freezed == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int?,secondRemainingToWait: freezed == secondRemainingToWait ? _self.secondRemainingToWait : secondRemainingToWait // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _ShowNotificationNoticed implements AuthState {
  const _ShowNotificationNoticed({this.retryRemaining, this.secondRemainingToWait});
  

@override final  int? retryRemaining;
@override final  int? secondRemainingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowNotificationNoticedCopyWith<_ShowNotificationNoticed> get copyWith => __$ShowNotificationNoticedCopyWithImpl<_ShowNotificationNoticed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowNotificationNoticed&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemainingToWait, secondRemainingToWait) || other.secondRemainingToWait == secondRemainingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemainingToWait);

@override
String toString() {
  return 'AuthState.showNotificationNoticed(retryRemaining: $retryRemaining, secondRemainingToWait: $secondRemainingToWait)';
}


}

/// @nodoc
abstract mixin class _$ShowNotificationNoticedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ShowNotificationNoticedCopyWith(_ShowNotificationNoticed value, $Res Function(_ShowNotificationNoticed) _then) = __$ShowNotificationNoticedCopyWithImpl;
@override @useResult
$Res call({
 int? retryRemaining, int? secondRemainingToWait
});




}
/// @nodoc
class __$ShowNotificationNoticedCopyWithImpl<$Res>
    implements _$ShowNotificationNoticedCopyWith<$Res> {
  __$ShowNotificationNoticedCopyWithImpl(this._self, this._then);

  final _ShowNotificationNoticed _self;
  final $Res Function(_ShowNotificationNoticed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryRemaining = freezed,Object? secondRemainingToWait = freezed,}) {
  return _then(_ShowNotificationNoticed(
retryRemaining: freezed == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int?,secondRemainingToWait: freezed == secondRemainingToWait ? _self.secondRemainingToWait : secondRemainingToWait // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
