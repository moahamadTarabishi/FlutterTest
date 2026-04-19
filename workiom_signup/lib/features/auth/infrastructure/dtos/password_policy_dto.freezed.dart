// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_policy_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordPolicyResultDto {

 PasswordPolicyDto get setting;
/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordPolicyResultDtoCopyWith<PasswordPolicyResultDto> get copyWith => _$PasswordPolicyResultDtoCopyWithImpl<PasswordPolicyResultDto>(this as PasswordPolicyResultDto, _$identity);

  /// Serializes this PasswordPolicyResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordPolicyResultDto&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'PasswordPolicyResultDto(setting: $setting)';
}


}

/// @nodoc
abstract mixin class $PasswordPolicyResultDtoCopyWith<$Res>  {
  factory $PasswordPolicyResultDtoCopyWith(PasswordPolicyResultDto value, $Res Function(PasswordPolicyResultDto) _then) = _$PasswordPolicyResultDtoCopyWithImpl;
@useResult
$Res call({
 PasswordPolicyDto setting
});


$PasswordPolicyDtoCopyWith<$Res> get setting;

}
/// @nodoc
class _$PasswordPolicyResultDtoCopyWithImpl<$Res>
    implements $PasswordPolicyResultDtoCopyWith<$Res> {
  _$PasswordPolicyResultDtoCopyWithImpl(this._self, this._then);

  final PasswordPolicyResultDto _self;
  final $Res Function(PasswordPolicyResultDto) _then;

/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setting = null,}) {
  return _then(_self.copyWith(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as PasswordPolicyDto,
  ));
}
/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordPolicyDtoCopyWith<$Res> get setting {
  
  return $PasswordPolicyDtoCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// Adds pattern-matching-related methods to [PasswordPolicyResultDto].
extension PasswordPolicyResultDtoPatterns on PasswordPolicyResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordPolicyResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordPolicyResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordPolicyResultDto value)  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicyResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordPolicyResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicyResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PasswordPolicyDto setting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordPolicyResultDto() when $default != null:
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PasswordPolicyDto setting)  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicyResultDto():
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PasswordPolicyDto setting)?  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicyResultDto() when $default != null:
return $default(_that.setting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordPolicyResultDto implements PasswordPolicyResultDto {
  const _PasswordPolicyResultDto({required this.setting});
  factory _PasswordPolicyResultDto.fromJson(Map<String, dynamic> json) => _$PasswordPolicyResultDtoFromJson(json);

@override final  PasswordPolicyDto setting;

/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordPolicyResultDtoCopyWith<_PasswordPolicyResultDto> get copyWith => __$PasswordPolicyResultDtoCopyWithImpl<_PasswordPolicyResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordPolicyResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordPolicyResultDto&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'PasswordPolicyResultDto(setting: $setting)';
}


}

/// @nodoc
abstract mixin class _$PasswordPolicyResultDtoCopyWith<$Res> implements $PasswordPolicyResultDtoCopyWith<$Res> {
  factory _$PasswordPolicyResultDtoCopyWith(_PasswordPolicyResultDto value, $Res Function(_PasswordPolicyResultDto) _then) = __$PasswordPolicyResultDtoCopyWithImpl;
@override @useResult
$Res call({
 PasswordPolicyDto setting
});


@override $PasswordPolicyDtoCopyWith<$Res> get setting;

}
/// @nodoc
class __$PasswordPolicyResultDtoCopyWithImpl<$Res>
    implements _$PasswordPolicyResultDtoCopyWith<$Res> {
  __$PasswordPolicyResultDtoCopyWithImpl(this._self, this._then);

  final _PasswordPolicyResultDto _self;
  final $Res Function(_PasswordPolicyResultDto) _then;

/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setting = null,}) {
  return _then(_PasswordPolicyResultDto(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as PasswordPolicyDto,
  ));
}

/// Create a copy of PasswordPolicyResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordPolicyDtoCopyWith<$Res> get setting {
  
  return $PasswordPolicyDtoCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// @nodoc
mixin _$PasswordPolicyDto {

 bool get requireDigit; bool get requireLowercase; bool get requireNonAlphanumeric; bool get requireUppercase; int get requiredLength;
/// Create a copy of PasswordPolicyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordPolicyDtoCopyWith<PasswordPolicyDto> get copyWith => _$PasswordPolicyDtoCopyWithImpl<PasswordPolicyDto>(this as PasswordPolicyDto, _$identity);

  /// Serializes this PasswordPolicyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordPolicyDto&&(identical(other.requireDigit, requireDigit) || other.requireDigit == requireDigit)&&(identical(other.requireLowercase, requireLowercase) || other.requireLowercase == requireLowercase)&&(identical(other.requireNonAlphanumeric, requireNonAlphanumeric) || other.requireNonAlphanumeric == requireNonAlphanumeric)&&(identical(other.requireUppercase, requireUppercase) || other.requireUppercase == requireUppercase)&&(identical(other.requiredLength, requiredLength) || other.requiredLength == requiredLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requireDigit,requireLowercase,requireNonAlphanumeric,requireUppercase,requiredLength);

@override
String toString() {
  return 'PasswordPolicyDto(requireDigit: $requireDigit, requireLowercase: $requireLowercase, requireNonAlphanumeric: $requireNonAlphanumeric, requireUppercase: $requireUppercase, requiredLength: $requiredLength)';
}


}

/// @nodoc
abstract mixin class $PasswordPolicyDtoCopyWith<$Res>  {
  factory $PasswordPolicyDtoCopyWith(PasswordPolicyDto value, $Res Function(PasswordPolicyDto) _then) = _$PasswordPolicyDtoCopyWithImpl;
@useResult
$Res call({
 bool requireDigit, bool requireLowercase, bool requireNonAlphanumeric, bool requireUppercase, int requiredLength
});




}
/// @nodoc
class _$PasswordPolicyDtoCopyWithImpl<$Res>
    implements $PasswordPolicyDtoCopyWith<$Res> {
  _$PasswordPolicyDtoCopyWithImpl(this._self, this._then);

  final PasswordPolicyDto _self;
  final $Res Function(PasswordPolicyDto) _then;

/// Create a copy of PasswordPolicyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requireDigit = null,Object? requireLowercase = null,Object? requireNonAlphanumeric = null,Object? requireUppercase = null,Object? requiredLength = null,}) {
  return _then(_self.copyWith(
requireDigit: null == requireDigit ? _self.requireDigit : requireDigit // ignore: cast_nullable_to_non_nullable
as bool,requireLowercase: null == requireLowercase ? _self.requireLowercase : requireLowercase // ignore: cast_nullable_to_non_nullable
as bool,requireNonAlphanumeric: null == requireNonAlphanumeric ? _self.requireNonAlphanumeric : requireNonAlphanumeric // ignore: cast_nullable_to_non_nullable
as bool,requireUppercase: null == requireUppercase ? _self.requireUppercase : requireUppercase // ignore: cast_nullable_to_non_nullable
as bool,requiredLength: null == requiredLength ? _self.requiredLength : requiredLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordPolicyDto].
extension PasswordPolicyDtoPatterns on PasswordPolicyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordPolicyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordPolicyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordPolicyDto value)  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordPolicyDto value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool requireDigit,  bool requireLowercase,  bool requireNonAlphanumeric,  bool requireUppercase,  int requiredLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordPolicyDto() when $default != null:
return $default(_that.requireDigit,_that.requireLowercase,_that.requireNonAlphanumeric,_that.requireUppercase,_that.requiredLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool requireDigit,  bool requireLowercase,  bool requireNonAlphanumeric,  bool requireUppercase,  int requiredLength)  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicyDto():
return $default(_that.requireDigit,_that.requireLowercase,_that.requireNonAlphanumeric,_that.requireUppercase,_that.requiredLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool requireDigit,  bool requireLowercase,  bool requireNonAlphanumeric,  bool requireUppercase,  int requiredLength)?  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicyDto() when $default != null:
return $default(_that.requireDigit,_that.requireLowercase,_that.requireNonAlphanumeric,_that.requireUppercase,_that.requiredLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordPolicyDto implements PasswordPolicyDto {
  const _PasswordPolicyDto({required this.requireDigit, required this.requireLowercase, required this.requireNonAlphanumeric, required this.requireUppercase, required this.requiredLength});
  factory _PasswordPolicyDto.fromJson(Map<String, dynamic> json) => _$PasswordPolicyDtoFromJson(json);

@override final  bool requireDigit;
@override final  bool requireLowercase;
@override final  bool requireNonAlphanumeric;
@override final  bool requireUppercase;
@override final  int requiredLength;

/// Create a copy of PasswordPolicyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordPolicyDtoCopyWith<_PasswordPolicyDto> get copyWith => __$PasswordPolicyDtoCopyWithImpl<_PasswordPolicyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordPolicyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordPolicyDto&&(identical(other.requireDigit, requireDigit) || other.requireDigit == requireDigit)&&(identical(other.requireLowercase, requireLowercase) || other.requireLowercase == requireLowercase)&&(identical(other.requireNonAlphanumeric, requireNonAlphanumeric) || other.requireNonAlphanumeric == requireNonAlphanumeric)&&(identical(other.requireUppercase, requireUppercase) || other.requireUppercase == requireUppercase)&&(identical(other.requiredLength, requiredLength) || other.requiredLength == requiredLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requireDigit,requireLowercase,requireNonAlphanumeric,requireUppercase,requiredLength);

@override
String toString() {
  return 'PasswordPolicyDto(requireDigit: $requireDigit, requireLowercase: $requireLowercase, requireNonAlphanumeric: $requireNonAlphanumeric, requireUppercase: $requireUppercase, requiredLength: $requiredLength)';
}


}

/// @nodoc
abstract mixin class _$PasswordPolicyDtoCopyWith<$Res> implements $PasswordPolicyDtoCopyWith<$Res> {
  factory _$PasswordPolicyDtoCopyWith(_PasswordPolicyDto value, $Res Function(_PasswordPolicyDto) _then) = __$PasswordPolicyDtoCopyWithImpl;
@override @useResult
$Res call({
 bool requireDigit, bool requireLowercase, bool requireNonAlphanumeric, bool requireUppercase, int requiredLength
});




}
/// @nodoc
class __$PasswordPolicyDtoCopyWithImpl<$Res>
    implements _$PasswordPolicyDtoCopyWith<$Res> {
  __$PasswordPolicyDtoCopyWithImpl(this._self, this._then);

  final _PasswordPolicyDto _self;
  final $Res Function(_PasswordPolicyDto) _then;

/// Create a copy of PasswordPolicyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requireDigit = null,Object? requireLowercase = null,Object? requireNonAlphanumeric = null,Object? requireUppercase = null,Object? requiredLength = null,}) {
  return _then(_PasswordPolicyDto(
requireDigit: null == requireDigit ? _self.requireDigit : requireDigit // ignore: cast_nullable_to_non_nullable
as bool,requireLowercase: null == requireLowercase ? _self.requireLowercase : requireLowercase // ignore: cast_nullable_to_non_nullable
as bool,requireNonAlphanumeric: null == requireNonAlphanumeric ? _self.requireNonAlphanumeric : requireNonAlphanumeric // ignore: cast_nullable_to_non_nullable
as bool,requireUppercase: null == requireUppercase ? _self.requireUppercase : requireUppercase // ignore: cast_nullable_to_non_nullable
as bool,requiredLength: null == requiredLength ? _self.requiredLength : requiredLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
