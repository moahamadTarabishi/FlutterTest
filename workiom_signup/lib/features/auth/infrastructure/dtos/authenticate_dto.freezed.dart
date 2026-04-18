// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticateRequestDto {

 String get userNameOrEmailAddress; String get password; String get tenancyName;// ianaTimeZone goes in body (different from RegisterTenant which uses ?timeZone= query param)
 String get ianaTimeZone; bool get rememberClient; String? get twoFactorVerificationCode; String? get captchaResponse; bool? get singleSignIn; String? get returnUrl;
/// Create a copy of AuthenticateRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticateRequestDtoCopyWith<AuthenticateRequestDto> get copyWith => _$AuthenticateRequestDtoCopyWithImpl<AuthenticateRequestDto>(this as AuthenticateRequestDto, _$identity);

  /// Serializes this AuthenticateRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticateRequestDto&&(identical(other.userNameOrEmailAddress, userNameOrEmailAddress) || other.userNameOrEmailAddress == userNameOrEmailAddress)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.ianaTimeZone, ianaTimeZone) || other.ianaTimeZone == ianaTimeZone)&&(identical(other.rememberClient, rememberClient) || other.rememberClient == rememberClient)&&(identical(other.twoFactorVerificationCode, twoFactorVerificationCode) || other.twoFactorVerificationCode == twoFactorVerificationCode)&&(identical(other.captchaResponse, captchaResponse) || other.captchaResponse == captchaResponse)&&(identical(other.singleSignIn, singleSignIn) || other.singleSignIn == singleSignIn)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userNameOrEmailAddress,password,tenancyName,ianaTimeZone,rememberClient,twoFactorVerificationCode,captchaResponse,singleSignIn,returnUrl);

@override
String toString() {
  return 'AuthenticateRequestDto(userNameOrEmailAddress: $userNameOrEmailAddress, password: $password, tenancyName: $tenancyName, ianaTimeZone: $ianaTimeZone, rememberClient: $rememberClient, twoFactorVerificationCode: $twoFactorVerificationCode, captchaResponse: $captchaResponse, singleSignIn: $singleSignIn, returnUrl: $returnUrl)';
}


}

/// @nodoc
abstract mixin class $AuthenticateRequestDtoCopyWith<$Res>  {
  factory $AuthenticateRequestDtoCopyWith(AuthenticateRequestDto value, $Res Function(AuthenticateRequestDto) _then) = _$AuthenticateRequestDtoCopyWithImpl;
@useResult
$Res call({
 String userNameOrEmailAddress, String password, String tenancyName, String ianaTimeZone, bool rememberClient, String? twoFactorVerificationCode, String? captchaResponse, bool? singleSignIn, String? returnUrl
});




}
/// @nodoc
class _$AuthenticateRequestDtoCopyWithImpl<$Res>
    implements $AuthenticateRequestDtoCopyWith<$Res> {
  _$AuthenticateRequestDtoCopyWithImpl(this._self, this._then);

  final AuthenticateRequestDto _self;
  final $Res Function(AuthenticateRequestDto) _then;

/// Create a copy of AuthenticateRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userNameOrEmailAddress = null,Object? password = null,Object? tenancyName = null,Object? ianaTimeZone = null,Object? rememberClient = null,Object? twoFactorVerificationCode = freezed,Object? captchaResponse = freezed,Object? singleSignIn = freezed,Object? returnUrl = freezed,}) {
  return _then(_self.copyWith(
userNameOrEmailAddress: null == userNameOrEmailAddress ? _self.userNameOrEmailAddress : userNameOrEmailAddress // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,ianaTimeZone: null == ianaTimeZone ? _self.ianaTimeZone : ianaTimeZone // ignore: cast_nullable_to_non_nullable
as String,rememberClient: null == rememberClient ? _self.rememberClient : rememberClient // ignore: cast_nullable_to_non_nullable
as bool,twoFactorVerificationCode: freezed == twoFactorVerificationCode ? _self.twoFactorVerificationCode : twoFactorVerificationCode // ignore: cast_nullable_to_non_nullable
as String?,captchaResponse: freezed == captchaResponse ? _self.captchaResponse : captchaResponse // ignore: cast_nullable_to_non_nullable
as String?,singleSignIn: freezed == singleSignIn ? _self.singleSignIn : singleSignIn // ignore: cast_nullable_to_non_nullable
as bool?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticateRequestDto].
extension AuthenticateRequestDtoPatterns on AuthenticateRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticateRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticateRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticateRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticateRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticateRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticateRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userNameOrEmailAddress,  String password,  String tenancyName,  String ianaTimeZone,  bool rememberClient,  String? twoFactorVerificationCode,  String? captchaResponse,  bool? singleSignIn,  String? returnUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticateRequestDto() when $default != null:
return $default(_that.userNameOrEmailAddress,_that.password,_that.tenancyName,_that.ianaTimeZone,_that.rememberClient,_that.twoFactorVerificationCode,_that.captchaResponse,_that.singleSignIn,_that.returnUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userNameOrEmailAddress,  String password,  String tenancyName,  String ianaTimeZone,  bool rememberClient,  String? twoFactorVerificationCode,  String? captchaResponse,  bool? singleSignIn,  String? returnUrl)  $default,) {final _that = this;
switch (_that) {
case _AuthenticateRequestDto():
return $default(_that.userNameOrEmailAddress,_that.password,_that.tenancyName,_that.ianaTimeZone,_that.rememberClient,_that.twoFactorVerificationCode,_that.captchaResponse,_that.singleSignIn,_that.returnUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userNameOrEmailAddress,  String password,  String tenancyName,  String ianaTimeZone,  bool rememberClient,  String? twoFactorVerificationCode,  String? captchaResponse,  bool? singleSignIn,  String? returnUrl)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticateRequestDto() when $default != null:
return $default(_that.userNameOrEmailAddress,_that.password,_that.tenancyName,_that.ianaTimeZone,_that.rememberClient,_that.twoFactorVerificationCode,_that.captchaResponse,_that.singleSignIn,_that.returnUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthenticateRequestDto implements AuthenticateRequestDto {
  const _AuthenticateRequestDto({required this.userNameOrEmailAddress, required this.password, required this.tenancyName, required this.ianaTimeZone, this.rememberClient = false, this.twoFactorVerificationCode, this.captchaResponse, this.singleSignIn, this.returnUrl});
  factory _AuthenticateRequestDto.fromJson(Map<String, dynamic> json) => _$AuthenticateRequestDtoFromJson(json);

@override final  String userNameOrEmailAddress;
@override final  String password;
@override final  String tenancyName;
// ianaTimeZone goes in body (different from RegisterTenant which uses ?timeZone= query param)
@override final  String ianaTimeZone;
@override@JsonKey() final  bool rememberClient;
@override final  String? twoFactorVerificationCode;
@override final  String? captchaResponse;
@override final  bool? singleSignIn;
@override final  String? returnUrl;

/// Create a copy of AuthenticateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticateRequestDtoCopyWith<_AuthenticateRequestDto> get copyWith => __$AuthenticateRequestDtoCopyWithImpl<_AuthenticateRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticateRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticateRequestDto&&(identical(other.userNameOrEmailAddress, userNameOrEmailAddress) || other.userNameOrEmailAddress == userNameOrEmailAddress)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.ianaTimeZone, ianaTimeZone) || other.ianaTimeZone == ianaTimeZone)&&(identical(other.rememberClient, rememberClient) || other.rememberClient == rememberClient)&&(identical(other.twoFactorVerificationCode, twoFactorVerificationCode) || other.twoFactorVerificationCode == twoFactorVerificationCode)&&(identical(other.captchaResponse, captchaResponse) || other.captchaResponse == captchaResponse)&&(identical(other.singleSignIn, singleSignIn) || other.singleSignIn == singleSignIn)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userNameOrEmailAddress,password,tenancyName,ianaTimeZone,rememberClient,twoFactorVerificationCode,captchaResponse,singleSignIn,returnUrl);

@override
String toString() {
  return 'AuthenticateRequestDto(userNameOrEmailAddress: $userNameOrEmailAddress, password: $password, tenancyName: $tenancyName, ianaTimeZone: $ianaTimeZone, rememberClient: $rememberClient, twoFactorVerificationCode: $twoFactorVerificationCode, captchaResponse: $captchaResponse, singleSignIn: $singleSignIn, returnUrl: $returnUrl)';
}


}

/// @nodoc
abstract mixin class _$AuthenticateRequestDtoCopyWith<$Res> implements $AuthenticateRequestDtoCopyWith<$Res> {
  factory _$AuthenticateRequestDtoCopyWith(_AuthenticateRequestDto value, $Res Function(_AuthenticateRequestDto) _then) = __$AuthenticateRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String userNameOrEmailAddress, String password, String tenancyName, String ianaTimeZone, bool rememberClient, String? twoFactorVerificationCode, String? captchaResponse, bool? singleSignIn, String? returnUrl
});




}
/// @nodoc
class __$AuthenticateRequestDtoCopyWithImpl<$Res>
    implements _$AuthenticateRequestDtoCopyWith<$Res> {
  __$AuthenticateRequestDtoCopyWithImpl(this._self, this._then);

  final _AuthenticateRequestDto _self;
  final $Res Function(_AuthenticateRequestDto) _then;

/// Create a copy of AuthenticateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userNameOrEmailAddress = null,Object? password = null,Object? tenancyName = null,Object? ianaTimeZone = null,Object? rememberClient = null,Object? twoFactorVerificationCode = freezed,Object? captchaResponse = freezed,Object? singleSignIn = freezed,Object? returnUrl = freezed,}) {
  return _then(_AuthenticateRequestDto(
userNameOrEmailAddress: null == userNameOrEmailAddress ? _self.userNameOrEmailAddress : userNameOrEmailAddress // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,ianaTimeZone: null == ianaTimeZone ? _self.ianaTimeZone : ianaTimeZone // ignore: cast_nullable_to_non_nullable
as String,rememberClient: null == rememberClient ? _self.rememberClient : rememberClient // ignore: cast_nullable_to_non_nullable
as bool,twoFactorVerificationCode: freezed == twoFactorVerificationCode ? _self.twoFactorVerificationCode : twoFactorVerificationCode // ignore: cast_nullable_to_non_nullable
as String?,captchaResponse: freezed == captchaResponse ? _self.captchaResponse : captchaResponse // ignore: cast_nullable_to_non_nullable
as String?,singleSignIn: freezed == singleSignIn ? _self.singleSignIn : singleSignIn // ignore: cast_nullable_to_non_nullable
as bool?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AuthenticateResponseDto {

 String? get accessToken; String? get encryptedAccessToken; int? get expireInSeconds; int? get userId;
/// Create a copy of AuthenticateResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticateResponseDtoCopyWith<AuthenticateResponseDto> get copyWith => _$AuthenticateResponseDtoCopyWithImpl<AuthenticateResponseDto>(this as AuthenticateResponseDto, _$identity);

  /// Serializes this AuthenticateResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticateResponseDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.encryptedAccessToken, encryptedAccessToken) || other.encryptedAccessToken == encryptedAccessToken)&&(identical(other.expireInSeconds, expireInSeconds) || other.expireInSeconds == expireInSeconds)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,encryptedAccessToken,expireInSeconds,userId);

@override
String toString() {
  return 'AuthenticateResponseDto(accessToken: $accessToken, encryptedAccessToken: $encryptedAccessToken, expireInSeconds: $expireInSeconds, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AuthenticateResponseDtoCopyWith<$Res>  {
  factory $AuthenticateResponseDtoCopyWith(AuthenticateResponseDto value, $Res Function(AuthenticateResponseDto) _then) = _$AuthenticateResponseDtoCopyWithImpl;
@useResult
$Res call({
 String? accessToken, String? encryptedAccessToken, int? expireInSeconds, int? userId
});




}
/// @nodoc
class _$AuthenticateResponseDtoCopyWithImpl<$Res>
    implements $AuthenticateResponseDtoCopyWith<$Res> {
  _$AuthenticateResponseDtoCopyWithImpl(this._self, this._then);

  final AuthenticateResponseDto _self;
  final $Res Function(AuthenticateResponseDto) _then;

/// Create a copy of AuthenticateResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? encryptedAccessToken = freezed,Object? expireInSeconds = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,encryptedAccessToken: freezed == encryptedAccessToken ? _self.encryptedAccessToken : encryptedAccessToken // ignore: cast_nullable_to_non_nullable
as String?,expireInSeconds: freezed == expireInSeconds ? _self.expireInSeconds : expireInSeconds // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticateResponseDto].
extension AuthenticateResponseDtoPatterns on AuthenticateResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticateResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticateResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticateResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticateResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticateResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticateResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? accessToken,  String? encryptedAccessToken,  int? expireInSeconds,  int? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticateResponseDto() when $default != null:
return $default(_that.accessToken,_that.encryptedAccessToken,_that.expireInSeconds,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? accessToken,  String? encryptedAccessToken,  int? expireInSeconds,  int? userId)  $default,) {final _that = this;
switch (_that) {
case _AuthenticateResponseDto():
return $default(_that.accessToken,_that.encryptedAccessToken,_that.expireInSeconds,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? accessToken,  String? encryptedAccessToken,  int? expireInSeconds,  int? userId)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticateResponseDto() when $default != null:
return $default(_that.accessToken,_that.encryptedAccessToken,_that.expireInSeconds,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthenticateResponseDto implements AuthenticateResponseDto {
  const _AuthenticateResponseDto({this.accessToken, this.encryptedAccessToken, this.expireInSeconds, this.userId});
  factory _AuthenticateResponseDto.fromJson(Map<String, dynamic> json) => _$AuthenticateResponseDtoFromJson(json);

@override final  String? accessToken;
@override final  String? encryptedAccessToken;
@override final  int? expireInSeconds;
@override final  int? userId;

/// Create a copy of AuthenticateResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticateResponseDtoCopyWith<_AuthenticateResponseDto> get copyWith => __$AuthenticateResponseDtoCopyWithImpl<_AuthenticateResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticateResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticateResponseDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.encryptedAccessToken, encryptedAccessToken) || other.encryptedAccessToken == encryptedAccessToken)&&(identical(other.expireInSeconds, expireInSeconds) || other.expireInSeconds == expireInSeconds)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,encryptedAccessToken,expireInSeconds,userId);

@override
String toString() {
  return 'AuthenticateResponseDto(accessToken: $accessToken, encryptedAccessToken: $encryptedAccessToken, expireInSeconds: $expireInSeconds, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AuthenticateResponseDtoCopyWith<$Res> implements $AuthenticateResponseDtoCopyWith<$Res> {
  factory _$AuthenticateResponseDtoCopyWith(_AuthenticateResponseDto value, $Res Function(_AuthenticateResponseDto) _then) = __$AuthenticateResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String? accessToken, String? encryptedAccessToken, int? expireInSeconds, int? userId
});




}
/// @nodoc
class __$AuthenticateResponseDtoCopyWithImpl<$Res>
    implements _$AuthenticateResponseDtoCopyWith<$Res> {
  __$AuthenticateResponseDtoCopyWithImpl(this._self, this._then);

  final _AuthenticateResponseDto _self;
  final $Res Function(_AuthenticateResponseDto) _then;

/// Create a copy of AuthenticateResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? encryptedAccessToken = freezed,Object? expireInSeconds = freezed,Object? userId = freezed,}) {
  return _then(_AuthenticateResponseDto(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,encryptedAccessToken: freezed == encryptedAccessToken ? _self.encryptedAccessToken : encryptedAccessToken // ignore: cast_nullable_to_non_nullable
as String?,expireInSeconds: freezed == expireInSeconds ? _self.expireInSeconds : expireInSeconds // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
