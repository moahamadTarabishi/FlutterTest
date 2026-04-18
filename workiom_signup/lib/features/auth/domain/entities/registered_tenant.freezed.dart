// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registered_tenant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisteredTenant {

 int? get tenantId; bool get isPending;
/// Create a copy of RegisteredTenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisteredTenantCopyWith<RegisteredTenant> get copyWith => _$RegisteredTenantCopyWithImpl<RegisteredTenant>(this as RegisteredTenant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisteredTenant&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}


@override
int get hashCode => Object.hash(runtimeType,tenantId,isPending);

@override
String toString() {
  return 'RegisteredTenant(tenantId: $tenantId, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $RegisteredTenantCopyWith<$Res>  {
  factory $RegisteredTenantCopyWith(RegisteredTenant value, $Res Function(RegisteredTenant) _then) = _$RegisteredTenantCopyWithImpl;
@useResult
$Res call({
 int? tenantId, bool isPending
});




}
/// @nodoc
class _$RegisteredTenantCopyWithImpl<$Res>
    implements $RegisteredTenantCopyWith<$Res> {
  _$RegisteredTenantCopyWithImpl(this._self, this._then);

  final RegisteredTenant _self;
  final $Res Function(RegisteredTenant) _then;

/// Create a copy of RegisteredTenant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = freezed,Object? isPending = null,}) {
  return _then(_self.copyWith(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisteredTenant].
extension RegisteredTenantPatterns on RegisteredTenant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisteredTenant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisteredTenant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisteredTenant value)  $default,){
final _that = this;
switch (_that) {
case _RegisteredTenant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisteredTenant value)?  $default,){
final _that = this;
switch (_that) {
case _RegisteredTenant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tenantId,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisteredTenant() when $default != null:
return $default(_that.tenantId,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tenantId,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _RegisteredTenant():
return $default(_that.tenantId,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tenantId,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _RegisteredTenant() when $default != null:
return $default(_that.tenantId,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc


class _RegisteredTenant implements RegisteredTenant {
  const _RegisteredTenant({this.tenantId, this.isPending = false});
  

@override final  int? tenantId;
@override@JsonKey() final  bool isPending;

/// Create a copy of RegisteredTenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisteredTenantCopyWith<_RegisteredTenant> get copyWith => __$RegisteredTenantCopyWithImpl<_RegisteredTenant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisteredTenant&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}


@override
int get hashCode => Object.hash(runtimeType,tenantId,isPending);

@override
String toString() {
  return 'RegisteredTenant(tenantId: $tenantId, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$RegisteredTenantCopyWith<$Res> implements $RegisteredTenantCopyWith<$Res> {
  factory _$RegisteredTenantCopyWith(_RegisteredTenant value, $Res Function(_RegisteredTenant) _then) = __$RegisteredTenantCopyWithImpl;
@override @useResult
$Res call({
 int? tenantId, bool isPending
});




}
/// @nodoc
class __$RegisteredTenantCopyWithImpl<$Res>
    implements _$RegisteredTenantCopyWith<$Res> {
  __$RegisteredTenantCopyWithImpl(this._self, this._then);

  final _RegisteredTenant _self;
  final $Res Function(_RegisteredTenant) _then;

/// Create a copy of RegisteredTenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = freezed,Object? isPending = null,}) {
  return _then(_RegisteredTenant(
tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
