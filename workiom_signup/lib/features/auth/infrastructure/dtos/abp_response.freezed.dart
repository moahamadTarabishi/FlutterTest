// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbpResponse<T> {

 T? get result; bool get success; AbpError? get error;@JsonKey(name: 'unAuthorizedRequest') bool get unauthorizedRequest;
/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbpResponseCopyWith<T, AbpResponse<T>> get copyWith => _$AbpResponseCopyWithImpl<T, AbpResponse<T>>(this as AbpResponse<T>, _$identity);

  /// Serializes this AbpResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbpResponse<T>&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.unauthorizedRequest, unauthorizedRequest) || other.unauthorizedRequest == unauthorizedRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result),success,error,unauthorizedRequest);

@override
String toString() {
  return 'AbpResponse<$T>(result: $result, success: $success, error: $error, unauthorizedRequest: $unauthorizedRequest)';
}


}

/// @nodoc
abstract mixin class $AbpResponseCopyWith<T,$Res>  {
  factory $AbpResponseCopyWith(AbpResponse<T> value, $Res Function(AbpResponse<T>) _then) = _$AbpResponseCopyWithImpl;
@useResult
$Res call({
 T? result, bool success, AbpError? error,@JsonKey(name: 'unAuthorizedRequest') bool unauthorizedRequest
});


$AbpErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$AbpResponseCopyWithImpl<T,$Res>
    implements $AbpResponseCopyWith<T, $Res> {
  _$AbpResponseCopyWithImpl(this._self, this._then);

  final AbpResponse<T> _self;
  final $Res Function(AbpResponse<T>) _then;

/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? success = null,Object? error = freezed,Object? unauthorizedRequest = null,}) {
  return _then(_self.copyWith(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as T?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AbpError?,unauthorizedRequest: null == unauthorizedRequest ? _self.unauthorizedRequest : unauthorizedRequest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbpErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AbpErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [AbpResponse].
extension AbpResponsePatterns<T> on AbpResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbpResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbpResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbpResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _AbpResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbpResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _AbpResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T? result,  bool success,  AbpError? error, @JsonKey(name: 'unAuthorizedRequest')  bool unauthorizedRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbpResponse() when $default != null:
return $default(_that.result,_that.success,_that.error,_that.unauthorizedRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T? result,  bool success,  AbpError? error, @JsonKey(name: 'unAuthorizedRequest')  bool unauthorizedRequest)  $default,) {final _that = this;
switch (_that) {
case _AbpResponse():
return $default(_that.result,_that.success,_that.error,_that.unauthorizedRequest);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T? result,  bool success,  AbpError? error, @JsonKey(name: 'unAuthorizedRequest')  bool unauthorizedRequest)?  $default,) {final _that = this;
switch (_that) {
case _AbpResponse() when $default != null:
return $default(_that.result,_that.success,_that.error,_that.unauthorizedRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _AbpResponse<T> implements AbpResponse<T> {
  const _AbpResponse({this.result, required this.success, this.error, @JsonKey(name: 'unAuthorizedRequest') this.unauthorizedRequest = false});
  factory _AbpResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$AbpResponseFromJson(json,fromJsonT);

@override final  T? result;
@override final  bool success;
@override final  AbpError? error;
@override@JsonKey(name: 'unAuthorizedRequest') final  bool unauthorizedRequest;

/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbpResponseCopyWith<T, _AbpResponse<T>> get copyWith => __$AbpResponseCopyWithImpl<T, _AbpResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$AbpResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbpResponse<T>&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.unauthorizedRequest, unauthorizedRequest) || other.unauthorizedRequest == unauthorizedRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result),success,error,unauthorizedRequest);

@override
String toString() {
  return 'AbpResponse<$T>(result: $result, success: $success, error: $error, unauthorizedRequest: $unauthorizedRequest)';
}


}

/// @nodoc
abstract mixin class _$AbpResponseCopyWith<T,$Res> implements $AbpResponseCopyWith<T, $Res> {
  factory _$AbpResponseCopyWith(_AbpResponse<T> value, $Res Function(_AbpResponse<T>) _then) = __$AbpResponseCopyWithImpl;
@override @useResult
$Res call({
 T? result, bool success, AbpError? error,@JsonKey(name: 'unAuthorizedRequest') bool unauthorizedRequest
});


@override $AbpErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$AbpResponseCopyWithImpl<T,$Res>
    implements _$AbpResponseCopyWith<T, $Res> {
  __$AbpResponseCopyWithImpl(this._self, this._then);

  final _AbpResponse<T> _self;
  final $Res Function(_AbpResponse<T>) _then;

/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? success = null,Object? error = freezed,Object? unauthorizedRequest = null,}) {
  return _then(_AbpResponse<T>(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as T?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AbpError?,unauthorizedRequest: null == unauthorizedRequest ? _self.unauthorizedRequest : unauthorizedRequest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AbpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbpErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AbpErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// @nodoc
mixin _$AbpError {

 int? get code; String? get message; String? get details;
/// Create a copy of AbpError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbpErrorCopyWith<AbpError> get copyWith => _$AbpErrorCopyWithImpl<AbpError>(this as AbpError, _$identity);

  /// Serializes this AbpError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbpError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,details);

@override
String toString() {
  return 'AbpError(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class $AbpErrorCopyWith<$Res>  {
  factory $AbpErrorCopyWith(AbpError value, $Res Function(AbpError) _then) = _$AbpErrorCopyWithImpl;
@useResult
$Res call({
 int? code, String? message, String? details
});




}
/// @nodoc
class _$AbpErrorCopyWithImpl<$Res>
    implements $AbpErrorCopyWith<$Res> {
  _$AbpErrorCopyWithImpl(this._self, this._then);

  final AbpError _self;
  final $Res Function(AbpError) _then;

/// Create a copy of AbpError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? message = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AbpError].
extension AbpErrorPatterns on AbpError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbpError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbpError() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbpError value)  $default,){
final _that = this;
switch (_that) {
case _AbpError():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbpError value)?  $default,){
final _that = this;
switch (_that) {
case _AbpError() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? code,  String? message,  String? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbpError() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? code,  String? message,  String? details)  $default,) {final _that = this;
switch (_that) {
case _AbpError():
return $default(_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? code,  String? message,  String? details)?  $default,) {final _that = this;
switch (_that) {
case _AbpError() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbpError implements AbpError {
  const _AbpError({this.code, this.message, this.details});
  factory _AbpError.fromJson(Map<String, dynamic> json) => _$AbpErrorFromJson(json);

@override final  int? code;
@override final  String? message;
@override final  String? details;

/// Create a copy of AbpError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbpErrorCopyWith<_AbpError> get copyWith => __$AbpErrorCopyWithImpl<_AbpError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbpErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbpError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,details);

@override
String toString() {
  return 'AbpError(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class _$AbpErrorCopyWith<$Res> implements $AbpErrorCopyWith<$Res> {
  factory _$AbpErrorCopyWith(_AbpError value, $Res Function(_AbpError) _then) = __$AbpErrorCopyWithImpl;
@override @useResult
$Res call({
 int? code, String? message, String? details
});




}
/// @nodoc
class __$AbpErrorCopyWithImpl<$Res>
    implements _$AbpErrorCopyWith<$Res> {
  __$AbpErrorCopyWithImpl(this._self, this._then);

  final _AbpError _self;
  final $Res Function(_AbpError) _then;

/// Create a copy of AbpError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = freezed,Object? details = freezed,}) {
  return _then(_AbpError(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
