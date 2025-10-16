// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 int get retryRemaining; int get secondRemaingToWait;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemaingToWait, secondRemaingToWait) || other.secondRemaingToWait == secondRemaingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemaingToWait);

@override
String toString() {
  return 'AuthState(retryRemaining: $retryRemaining, secondRemaingToWait: $secondRemaingToWait)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 int retryRemaining, int secondRemaingToWait
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
@pragma('vm:prefer-inline') @override $Res call({Object? retryRemaining = null,Object? secondRemaingToWait = null,}) {
  return _then(_self.copyWith(
retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemaingToWait: null == secondRemaingToWait ? _self.secondRemaingToWait : secondRemaingToWait // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthFailed value)?  failed,TResult Function( AuthSuccess value)?  success,TResult Function( ShowNotificationNoticed value)?  showNotificationNoticed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthFailed() when failed != null:
return failed(_that);case AuthSuccess() when success != null:
return success(_that);case ShowNotificationNoticed() when showNotificationNoticed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthFailed value)  failed,required TResult Function( AuthSuccess value)  success,required TResult Function( ShowNotificationNoticed value)  showNotificationNoticed,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthFailed():
return failed(_that);case AuthSuccess():
return success(_that);case ShowNotificationNoticed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthFailed value)?  failed,TResult? Function( AuthSuccess value)?  success,TResult? Function( ShowNotificationNoticed value)?  showNotificationNoticed,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthFailed() when failed != null:
return failed(_that);case AuthSuccess() when success != null:
return success(_that);case ShowNotificationNoticed() when showNotificationNoticed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int retryRemaining,  int secondRemaingToWait)?  initial,TResult Function( String message,  int retryRemaining,  int secondRemaingToWait)?  failed,TResult Function( AuthEntity authEntity,  int retryRemaining,  int secondRemaingToWait)?  success,TResult Function( int retryRemaining,  int secondRemaingToWait)?  showNotificationNoticed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that.retryRemaining,_that.secondRemaingToWait);case AuthFailed() when failed != null:
return failed(_that.message,_that.retryRemaining,_that.secondRemaingToWait);case AuthSuccess() when success != null:
return success(_that.authEntity,_that.retryRemaining,_that.secondRemaingToWait);case ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that.retryRemaining,_that.secondRemaingToWait);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int retryRemaining,  int secondRemaingToWait)  initial,required TResult Function( String message,  int retryRemaining,  int secondRemaingToWait)  failed,required TResult Function( AuthEntity authEntity,  int retryRemaining,  int secondRemaingToWait)  success,required TResult Function( int retryRemaining,  int secondRemaingToWait)  showNotificationNoticed,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that.retryRemaining,_that.secondRemaingToWait);case AuthFailed():
return failed(_that.message,_that.retryRemaining,_that.secondRemaingToWait);case AuthSuccess():
return success(_that.authEntity,_that.retryRemaining,_that.secondRemaingToWait);case ShowNotificationNoticed():
return showNotificationNoticed(_that.retryRemaining,_that.secondRemaingToWait);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int retryRemaining,  int secondRemaingToWait)?  initial,TResult? Function( String message,  int retryRemaining,  int secondRemaingToWait)?  failed,TResult? Function( AuthEntity authEntity,  int retryRemaining,  int secondRemaingToWait)?  success,TResult? Function( int retryRemaining,  int secondRemaingToWait)?  showNotificationNoticed,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that.retryRemaining,_that.secondRemaingToWait);case AuthFailed() when failed != null:
return failed(_that.message,_that.retryRemaining,_that.secondRemaingToWait);case AuthSuccess() when success != null:
return success(_that.authEntity,_that.retryRemaining,_that.secondRemaingToWait);case ShowNotificationNoticed() when showNotificationNoticed != null:
return showNotificationNoticed(_that.retryRemaining,_that.secondRemaingToWait);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial({this.retryRemaining = 5, this.secondRemaingToWait = 300});
  

@override@JsonKey() final  int retryRemaining;
@override@JsonKey() final  int secondRemaingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthInitialCopyWith<AuthInitial> get copyWith => _$AuthInitialCopyWithImpl<AuthInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemaingToWait, secondRemaingToWait) || other.secondRemaingToWait == secondRemaingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemaingToWait);

@override
String toString() {
  return 'AuthState.initial(retryRemaining: $retryRemaining, secondRemaingToWait: $secondRemaingToWait)';
}


}

/// @nodoc
abstract mixin class $AuthInitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthInitialCopyWith(AuthInitial value, $Res Function(AuthInitial) _then) = _$AuthInitialCopyWithImpl;
@override @useResult
$Res call({
 int retryRemaining, int secondRemaingToWait
});




}
/// @nodoc
class _$AuthInitialCopyWithImpl<$Res>
    implements $AuthInitialCopyWith<$Res> {
  _$AuthInitialCopyWithImpl(this._self, this._then);

  final AuthInitial _self;
  final $Res Function(AuthInitial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryRemaining = null,Object? secondRemaingToWait = null,}) {
  return _then(AuthInitial(
retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemaingToWait: null == secondRemaingToWait ? _self.secondRemaingToWait : secondRemaingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AuthFailed implements AuthState {
  const AuthFailed({required this.message, this.retryRemaining = 5, this.secondRemaingToWait = 300});
  

 final  String message;
@override@JsonKey() final  int retryRemaining;
@override@JsonKey() final  int secondRemaingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailedCopyWith<AuthFailed> get copyWith => _$AuthFailedCopyWithImpl<AuthFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailed&&(identical(other.message, message) || other.message == message)&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemaingToWait, secondRemaingToWait) || other.secondRemaingToWait == secondRemaingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,message,retryRemaining,secondRemaingToWait);

@override
String toString() {
  return 'AuthState.failed(message: $message, retryRemaining: $retryRemaining, secondRemaingToWait: $secondRemaingToWait)';
}


}

/// @nodoc
abstract mixin class $AuthFailedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailedCopyWith(AuthFailed value, $Res Function(AuthFailed) _then) = _$AuthFailedCopyWithImpl;
@override @useResult
$Res call({
 String message, int retryRemaining, int secondRemaingToWait
});




}
/// @nodoc
class _$AuthFailedCopyWithImpl<$Res>
    implements $AuthFailedCopyWith<$Res> {
  _$AuthFailedCopyWithImpl(this._self, this._then);

  final AuthFailed _self;
  final $Res Function(AuthFailed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? retryRemaining = null,Object? secondRemaingToWait = null,}) {
  return _then(AuthFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemaingToWait: null == secondRemaingToWait ? _self.secondRemaingToWait : secondRemaingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AuthSuccess implements AuthState {
  const AuthSuccess({required this.authEntity, this.retryRemaining = 5, this.secondRemaingToWait = 300});
  

 final  AuthEntity authEntity;
@override@JsonKey() final  int retryRemaining;
@override@JsonKey() final  int secondRemaingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSuccessCopyWith<AuthSuccess> get copyWith => _$AuthSuccessCopyWithImpl<AuthSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccess&&(identical(other.authEntity, authEntity) || other.authEntity == authEntity)&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemaingToWait, secondRemaingToWait) || other.secondRemaingToWait == secondRemaingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,authEntity,retryRemaining,secondRemaingToWait);

@override
String toString() {
  return 'AuthState.success(authEntity: $authEntity, retryRemaining: $retryRemaining, secondRemaingToWait: $secondRemaingToWait)';
}


}

/// @nodoc
abstract mixin class $AuthSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthSuccessCopyWith(AuthSuccess value, $Res Function(AuthSuccess) _then) = _$AuthSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthEntity authEntity, int retryRemaining, int secondRemaingToWait
});




}
/// @nodoc
class _$AuthSuccessCopyWithImpl<$Res>
    implements $AuthSuccessCopyWith<$Res> {
  _$AuthSuccessCopyWithImpl(this._self, this._then);

  final AuthSuccess _self;
  final $Res Function(AuthSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authEntity = null,Object? retryRemaining = null,Object? secondRemaingToWait = null,}) {
  return _then(AuthSuccess(
authEntity: null == authEntity ? _self.authEntity : authEntity // ignore: cast_nullable_to_non_nullable
as AuthEntity,retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemaingToWait: null == secondRemaingToWait ? _self.secondRemaingToWait : secondRemaingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ShowNotificationNoticed implements AuthState {
  const ShowNotificationNoticed({this.retryRemaining = 5, this.secondRemaingToWait = 300});
  

@override@JsonKey() final  int retryRemaining;
@override@JsonKey() final  int secondRemaingToWait;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowNotificationNoticedCopyWith<ShowNotificationNoticed> get copyWith => _$ShowNotificationNoticedCopyWithImpl<ShowNotificationNoticed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowNotificationNoticed&&(identical(other.retryRemaining, retryRemaining) || other.retryRemaining == retryRemaining)&&(identical(other.secondRemaingToWait, secondRemaingToWait) || other.secondRemaingToWait == secondRemaingToWait));
}


@override
int get hashCode => Object.hash(runtimeType,retryRemaining,secondRemaingToWait);

@override
String toString() {
  return 'AuthState.showNotificationNoticed(retryRemaining: $retryRemaining, secondRemaingToWait: $secondRemaingToWait)';
}


}

/// @nodoc
abstract mixin class $ShowNotificationNoticedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ShowNotificationNoticedCopyWith(ShowNotificationNoticed value, $Res Function(ShowNotificationNoticed) _then) = _$ShowNotificationNoticedCopyWithImpl;
@override @useResult
$Res call({
 int retryRemaining, int secondRemaingToWait
});




}
/// @nodoc
class _$ShowNotificationNoticedCopyWithImpl<$Res>
    implements $ShowNotificationNoticedCopyWith<$Res> {
  _$ShowNotificationNoticedCopyWithImpl(this._self, this._then);

  final ShowNotificationNoticed _self;
  final $Res Function(ShowNotificationNoticed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryRemaining = null,Object? secondRemaingToWait = null,}) {
  return _then(ShowNotificationNoticed(
retryRemaining: null == retryRemaining ? _self.retryRemaining : retryRemaining // ignore: cast_nullable_to_non_nullable
as int,secondRemaingToWait: null == secondRemaingToWait ? _self.secondRemaingToWait : secondRemaingToWait // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
