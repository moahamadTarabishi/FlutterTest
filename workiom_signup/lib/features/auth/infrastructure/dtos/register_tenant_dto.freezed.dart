// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_tenant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterTenantRequestDto {

 String get tenancyName; String get name; String get adminEmailAddress; String get adminPassword; int get editionId;// Must be present and null — ABP rejects the request if omitted entirely.
 String? get captchaResponse;
/// Create a copy of RegisterTenantRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterTenantRequestDtoCopyWith<RegisterTenantRequestDto> get copyWith => _$RegisterTenantRequestDtoCopyWithImpl<RegisterTenantRequestDto>(this as RegisterTenantRequestDto, _$identity);

  /// Serializes this RegisterTenantRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterTenantRequestDto&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name)&&(identical(other.adminEmailAddress, adminEmailAddress) || other.adminEmailAddress == adminEmailAddress)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.captchaResponse, captchaResponse) || other.captchaResponse == captchaResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenancyName,name,adminEmailAddress,adminPassword,editionId,captchaResponse);

@override
String toString() {
  return 'RegisterTenantRequestDto(tenancyName: $tenancyName, name: $name, adminEmailAddress: $adminEmailAddress, adminPassword: $adminPassword, editionId: $editionId, captchaResponse: $captchaResponse)';
}


}

/// @nodoc
abstract mixin class $RegisterTenantRequestDtoCopyWith<$Res>  {
  factory $RegisterTenantRequestDtoCopyWith(RegisterTenantRequestDto value, $Res Function(RegisterTenantRequestDto) _then) = _$RegisterTenantRequestDtoCopyWithImpl;
@useResult
$Res call({
 String tenancyName, String name, String adminEmailAddress, String adminPassword, int editionId, String? captchaResponse
});




}
/// @nodoc
class _$RegisterTenantRequestDtoCopyWithImpl<$Res>
    implements $RegisterTenantRequestDtoCopyWith<$Res> {
  _$RegisterTenantRequestDtoCopyWithImpl(this._self, this._then);

  final RegisterTenantRequestDto _self;
  final $Res Function(RegisterTenantRequestDto) _then;

/// Create a copy of RegisterTenantRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenancyName = null,Object? name = null,Object? adminEmailAddress = null,Object? adminPassword = null,Object? editionId = null,Object? captchaResponse = freezed,}) {
  return _then(_self.copyWith(
tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adminEmailAddress: null == adminEmailAddress ? _self.adminEmailAddress : adminEmailAddress // ignore: cast_nullable_to_non_nullable
as String,adminPassword: null == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as int,captchaResponse: freezed == captchaResponse ? _self.captchaResponse : captchaResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterTenantRequestDto].
extension RegisterTenantRequestDtoPatterns on RegisterTenantRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterTenantRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterTenantRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterTenantRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterTenantRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterTenantRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterTenantRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenancyName,  String name,  String adminEmailAddress,  String adminPassword,  int editionId,  String? captchaResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterTenantRequestDto() when $default != null:
return $default(_that.tenancyName,_that.name,_that.adminEmailAddress,_that.adminPassword,_that.editionId,_that.captchaResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenancyName,  String name,  String adminEmailAddress,  String adminPassword,  int editionId,  String? captchaResponse)  $default,) {final _that = this;
switch (_that) {
case _RegisterTenantRequestDto():
return $default(_that.tenancyName,_that.name,_that.adminEmailAddress,_that.adminPassword,_that.editionId,_that.captchaResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenancyName,  String name,  String adminEmailAddress,  String adminPassword,  int editionId,  String? captchaResponse)?  $default,) {final _that = this;
switch (_that) {
case _RegisterTenantRequestDto() when $default != null:
return $default(_that.tenancyName,_that.name,_that.adminEmailAddress,_that.adminPassword,_that.editionId,_that.captchaResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterTenantRequestDto implements RegisterTenantRequestDto {
  const _RegisterTenantRequestDto({required this.tenancyName, required this.name, required this.adminEmailAddress, required this.adminPassword, required this.editionId, this.captchaResponse});
  factory _RegisterTenantRequestDto.fromJson(Map<String, dynamic> json) => _$RegisterTenantRequestDtoFromJson(json);

@override final  String tenancyName;
@override final  String name;
@override final  String adminEmailAddress;
@override final  String adminPassword;
@override final  int editionId;
// Must be present and null — ABP rejects the request if omitted entirely.
@override final  String? captchaResponse;

/// Create a copy of RegisterTenantRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterTenantRequestDtoCopyWith<_RegisterTenantRequestDto> get copyWith => __$RegisterTenantRequestDtoCopyWithImpl<_RegisterTenantRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterTenantRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterTenantRequestDto&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name)&&(identical(other.adminEmailAddress, adminEmailAddress) || other.adminEmailAddress == adminEmailAddress)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword)&&(identical(other.editionId, editionId) || other.editionId == editionId)&&(identical(other.captchaResponse, captchaResponse) || other.captchaResponse == captchaResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenancyName,name,adminEmailAddress,adminPassword,editionId,captchaResponse);

@override
String toString() {
  return 'RegisterTenantRequestDto(tenancyName: $tenancyName, name: $name, adminEmailAddress: $adminEmailAddress, adminPassword: $adminPassword, editionId: $editionId, captchaResponse: $captchaResponse)';
}


}

/// @nodoc
abstract mixin class _$RegisterTenantRequestDtoCopyWith<$Res> implements $RegisterTenantRequestDtoCopyWith<$Res> {
  factory _$RegisterTenantRequestDtoCopyWith(_RegisterTenantRequestDto value, $Res Function(_RegisterTenantRequestDto) _then) = __$RegisterTenantRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String tenancyName, String name, String adminEmailAddress, String adminPassword, int editionId, String? captchaResponse
});




}
/// @nodoc
class __$RegisterTenantRequestDtoCopyWithImpl<$Res>
    implements _$RegisterTenantRequestDtoCopyWith<$Res> {
  __$RegisterTenantRequestDtoCopyWithImpl(this._self, this._then);

  final _RegisterTenantRequestDto _self;
  final $Res Function(_RegisterTenantRequestDto) _then;

/// Create a copy of RegisterTenantRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenancyName = null,Object? name = null,Object? adminEmailAddress = null,Object? adminPassword = null,Object? editionId = null,Object? captchaResponse = freezed,}) {
  return _then(_RegisterTenantRequestDto(
tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adminEmailAddress: null == adminEmailAddress ? _self.adminEmailAddress : adminEmailAddress // ignore: cast_nullable_to_non_nullable
as String,adminPassword: null == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String,editionId: null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as int,captchaResponse: freezed == captchaResponse ? _self.captchaResponse : captchaResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RegisterTenantResponseDto {

 int? get tenantId; bool get isActive; bool get isPending;
/// Create a copy of RegisterTenantResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterTenantResponseDtoCopyWith<RegisterTenantResponseDto> get copyWith => _$RegisterTenantResponseDtoCopyWithImpl<RegisterTenantResponseDto>(this as RegisterTenantResponseDto, _$identity);

  /// Serializes this RegisterTenantResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterTenantResponseDto&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,isActive,isPending);

@override
String toString() {
  return 'RegisterTenantResponseDto(tenantId: $tenantId, isActive: $isActive, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $RegisterTenantResponseDtoCopyWith<$Res>  {
  factory $RegisterTenantResponseDtoCopyWith(RegisterTenantResponseDto value, $Res Function(RegisterTenantResponseDto) _then) = _$RegisterTenantResponseDtoCopyWithImpl;
@useResult
$Res call({
 int? tenantId, bool isActive, bool isPending
});




}
/// @nodoc
class _$RegisterTenantResponseDtoCopyWithImpl<$Res>
    implements $RegisterTenantResponseDtoCopyWith<$Res> {
  _$RegisterTenantResponseDtoCopyWithImpl(this._self, this._then);

  final RegisterTenantResponseDto _self;
  final $Res Function(RegisterTenantResponseDto) _then;

/// Create a copy of RegisterTenantResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = freezed,Object? isActive = null,Object? isPending = null,}) {
  return _then(_self.copyWith(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterTenantResponseDto].
extension RegisterTenantResponseDtoPatterns on RegisterTenantResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterTenantResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterTenantResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterTenantResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterTenantResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterTenantResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterTenantResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tenantId,  bool isActive,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterTenantResponseDto() when $default != null:
return $default(_that.tenantId,_that.isActive,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tenantId,  bool isActive,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _RegisterTenantResponseDto():
return $default(_that.tenantId,_that.isActive,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tenantId,  bool isActive,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _RegisterTenantResponseDto() when $default != null:
return $default(_that.tenantId,_that.isActive,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterTenantResponseDto implements RegisterTenantResponseDto {
  const _RegisterTenantResponseDto({this.tenantId, this.isActive = false, this.isPending = false});
  factory _RegisterTenantResponseDto.fromJson(Map<String, dynamic> json) => _$RegisterTenantResponseDtoFromJson(json);

@override final  int? tenantId;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool isPending;

/// Create a copy of RegisterTenantResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterTenantResponseDtoCopyWith<_RegisterTenantResponseDto> get copyWith => __$RegisterTenantResponseDtoCopyWithImpl<_RegisterTenantResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterTenantResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterTenantResponseDto&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,isActive,isPending);

@override
String toString() {
  return 'RegisterTenantResponseDto(tenantId: $tenantId, isActive: $isActive, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$RegisterTenantResponseDtoCopyWith<$Res> implements $RegisterTenantResponseDtoCopyWith<$Res> {
  factory _$RegisterTenantResponseDtoCopyWith(_RegisterTenantResponseDto value, $Res Function(_RegisterTenantResponseDto) _then) = __$RegisterTenantResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int? tenantId, bool isActive, bool isPending
});




}
/// @nodoc
class __$RegisterTenantResponseDtoCopyWithImpl<$Res>
    implements _$RegisterTenantResponseDtoCopyWith<$Res> {
  __$RegisterTenantResponseDtoCopyWithImpl(this._self, this._then);

  final _RegisterTenantResponseDto _self;
  final $Res Function(_RegisterTenantResponseDto) _then;

/// Create a copy of RegisterTenantResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = freezed,Object? isActive = null,Object? isPending = null,}) {
  return _then(_RegisterTenantResponseDto(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
