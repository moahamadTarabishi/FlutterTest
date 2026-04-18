// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_availability_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantAvailabilityDto {

 int? get tenantId; int get state;
/// Create a copy of TenantAvailabilityDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantAvailabilityDtoCopyWith<TenantAvailabilityDto> get copyWith => _$TenantAvailabilityDtoCopyWithImpl<TenantAvailabilityDto>(this as TenantAvailabilityDto, _$identity);

  /// Serializes this TenantAvailabilityDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantAvailabilityDto&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,state);

@override
String toString() {
  return 'TenantAvailabilityDto(tenantId: $tenantId, state: $state)';
}


}

/// @nodoc
abstract mixin class $TenantAvailabilityDtoCopyWith<$Res>  {
  factory $TenantAvailabilityDtoCopyWith(TenantAvailabilityDto value, $Res Function(TenantAvailabilityDto) _then) = _$TenantAvailabilityDtoCopyWithImpl;
@useResult
$Res call({
 int? tenantId, int state
});




}
/// @nodoc
class _$TenantAvailabilityDtoCopyWithImpl<$Res>
    implements $TenantAvailabilityDtoCopyWith<$Res> {
  _$TenantAvailabilityDtoCopyWithImpl(this._self, this._then);

  final TenantAvailabilityDto _self;
  final $Res Function(TenantAvailabilityDto) _then;

/// Create a copy of TenantAvailabilityDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = freezed,Object? state = null,}) {
  return _then(_self.copyWith(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantAvailabilityDto].
extension TenantAvailabilityDtoPatterns on TenantAvailabilityDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantAvailabilityDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantAvailabilityDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantAvailabilityDto value)  $default,){
final _that = this;
switch (_that) {
case _TenantAvailabilityDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantAvailabilityDto value)?  $default,){
final _that = this;
switch (_that) {
case _TenantAvailabilityDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tenantId,  int state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantAvailabilityDto() when $default != null:
return $default(_that.tenantId,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tenantId,  int state)  $default,) {final _that = this;
switch (_that) {
case _TenantAvailabilityDto():
return $default(_that.tenantId,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tenantId,  int state)?  $default,) {final _that = this;
switch (_that) {
case _TenantAvailabilityDto() when $default != null:
return $default(_that.tenantId,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantAvailabilityDto implements TenantAvailabilityDto {
  const _TenantAvailabilityDto({this.tenantId, this.state = 0});
  factory _TenantAvailabilityDto.fromJson(Map<String, dynamic> json) => _$TenantAvailabilityDtoFromJson(json);

@override final  int? tenantId;
@override@JsonKey() final  int state;

/// Create a copy of TenantAvailabilityDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantAvailabilityDtoCopyWith<_TenantAvailabilityDto> get copyWith => __$TenantAvailabilityDtoCopyWithImpl<_TenantAvailabilityDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantAvailabilityDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantAvailabilityDto&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,state);

@override
String toString() {
  return 'TenantAvailabilityDto(tenantId: $tenantId, state: $state)';
}


}

/// @nodoc
abstract mixin class _$TenantAvailabilityDtoCopyWith<$Res> implements $TenantAvailabilityDtoCopyWith<$Res> {
  factory _$TenantAvailabilityDtoCopyWith(_TenantAvailabilityDto value, $Res Function(_TenantAvailabilityDto) _then) = __$TenantAvailabilityDtoCopyWithImpl;
@override @useResult
$Res call({
 int? tenantId, int state
});




}
/// @nodoc
class __$TenantAvailabilityDtoCopyWithImpl<$Res>
    implements _$TenantAvailabilityDtoCopyWith<$Res> {
  __$TenantAvailabilityDtoCopyWithImpl(this._self, this._then);

  final _TenantAvailabilityDto _self;
  final $Res Function(_TenantAvailabilityDto) _then;

/// Create a copy of TenantAvailabilityDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = freezed,Object? state = null,}) {
  return _then(_TenantAvailabilityDto(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
