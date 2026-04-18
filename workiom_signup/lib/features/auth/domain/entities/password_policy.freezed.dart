// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordPolicy {

 int get requiredLength; bool get requireUppercase; bool get requireLowercase; bool get requireDigit; bool get requireNonAlphanumeric;
/// Create a copy of PasswordPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordPolicyCopyWith<PasswordPolicy> get copyWith => _$PasswordPolicyCopyWithImpl<PasswordPolicy>(this as PasswordPolicy, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordPolicy&&(identical(other.requiredLength, requiredLength) || other.requiredLength == requiredLength)&&(identical(other.requireUppercase, requireUppercase) || other.requireUppercase == requireUppercase)&&(identical(other.requireLowercase, requireLowercase) || other.requireLowercase == requireLowercase)&&(identical(other.requireDigit, requireDigit) || other.requireDigit == requireDigit)&&(identical(other.requireNonAlphanumeric, requireNonAlphanumeric) || other.requireNonAlphanumeric == requireNonAlphanumeric));
}


@override
int get hashCode => Object.hash(runtimeType,requiredLength,requireUppercase,requireLowercase,requireDigit,requireNonAlphanumeric);

@override
String toString() {
  return 'PasswordPolicy(requiredLength: $requiredLength, requireUppercase: $requireUppercase, requireLowercase: $requireLowercase, requireDigit: $requireDigit, requireNonAlphanumeric: $requireNonAlphanumeric)';
}


}

/// @nodoc
abstract mixin class $PasswordPolicyCopyWith<$Res>  {
  factory $PasswordPolicyCopyWith(PasswordPolicy value, $Res Function(PasswordPolicy) _then) = _$PasswordPolicyCopyWithImpl;
@useResult
$Res call({
 int requiredLength, bool requireUppercase, bool requireLowercase, bool requireDigit, bool requireNonAlphanumeric
});




}
/// @nodoc
class _$PasswordPolicyCopyWithImpl<$Res>
    implements $PasswordPolicyCopyWith<$Res> {
  _$PasswordPolicyCopyWithImpl(this._self, this._then);

  final PasswordPolicy _self;
  final $Res Function(PasswordPolicy) _then;

/// Create a copy of PasswordPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requiredLength = null,Object? requireUppercase = null,Object? requireLowercase = null,Object? requireDigit = null,Object? requireNonAlphanumeric = null,}) {
  return _then(_self.copyWith(
requiredLength: null == requiredLength ? _self.requiredLength : requiredLength // ignore: cast_nullable_to_non_nullable
as int,requireUppercase: null == requireUppercase ? _self.requireUppercase : requireUppercase // ignore: cast_nullable_to_non_nullable
as bool,requireLowercase: null == requireLowercase ? _self.requireLowercase : requireLowercase // ignore: cast_nullable_to_non_nullable
as bool,requireDigit: null == requireDigit ? _self.requireDigit : requireDigit // ignore: cast_nullable_to_non_nullable
as bool,requireNonAlphanumeric: null == requireNonAlphanumeric ? _self.requireNonAlphanumeric : requireNonAlphanumeric // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordPolicy].
extension PasswordPolicyPatterns on PasswordPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordPolicy value)  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int requiredLength,  bool requireUppercase,  bool requireLowercase,  bool requireDigit,  bool requireNonAlphanumeric)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordPolicy() when $default != null:
return $default(_that.requiredLength,_that.requireUppercase,_that.requireLowercase,_that.requireDigit,_that.requireNonAlphanumeric);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int requiredLength,  bool requireUppercase,  bool requireLowercase,  bool requireDigit,  bool requireNonAlphanumeric)  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicy():
return $default(_that.requiredLength,_that.requireUppercase,_that.requireLowercase,_that.requireDigit,_that.requireNonAlphanumeric);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int requiredLength,  bool requireUppercase,  bool requireLowercase,  bool requireDigit,  bool requireNonAlphanumeric)?  $default,) {final _that = this;
switch (_that) {
case _PasswordPolicy() when $default != null:
return $default(_that.requiredLength,_that.requireUppercase,_that.requireLowercase,_that.requireDigit,_that.requireNonAlphanumeric);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordPolicy implements PasswordPolicy {
  const _PasswordPolicy({this.requiredLength = 8, this.requireUppercase = false, this.requireLowercase = false, this.requireDigit = false, this.requireNonAlphanumeric = false});
  

@override@JsonKey() final  int requiredLength;
@override@JsonKey() final  bool requireUppercase;
@override@JsonKey() final  bool requireLowercase;
@override@JsonKey() final  bool requireDigit;
@override@JsonKey() final  bool requireNonAlphanumeric;

/// Create a copy of PasswordPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordPolicyCopyWith<_PasswordPolicy> get copyWith => __$PasswordPolicyCopyWithImpl<_PasswordPolicy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordPolicy&&(identical(other.requiredLength, requiredLength) || other.requiredLength == requiredLength)&&(identical(other.requireUppercase, requireUppercase) || other.requireUppercase == requireUppercase)&&(identical(other.requireLowercase, requireLowercase) || other.requireLowercase == requireLowercase)&&(identical(other.requireDigit, requireDigit) || other.requireDigit == requireDigit)&&(identical(other.requireNonAlphanumeric, requireNonAlphanumeric) || other.requireNonAlphanumeric == requireNonAlphanumeric));
}


@override
int get hashCode => Object.hash(runtimeType,requiredLength,requireUppercase,requireLowercase,requireDigit,requireNonAlphanumeric);

@override
String toString() {
  return 'PasswordPolicy(requiredLength: $requiredLength, requireUppercase: $requireUppercase, requireLowercase: $requireLowercase, requireDigit: $requireDigit, requireNonAlphanumeric: $requireNonAlphanumeric)';
}


}

/// @nodoc
abstract mixin class _$PasswordPolicyCopyWith<$Res> implements $PasswordPolicyCopyWith<$Res> {
  factory _$PasswordPolicyCopyWith(_PasswordPolicy value, $Res Function(_PasswordPolicy) _then) = __$PasswordPolicyCopyWithImpl;
@override @useResult
$Res call({
 int requiredLength, bool requireUppercase, bool requireLowercase, bool requireDigit, bool requireNonAlphanumeric
});




}
/// @nodoc
class __$PasswordPolicyCopyWithImpl<$Res>
    implements _$PasswordPolicyCopyWith<$Res> {
  __$PasswordPolicyCopyWithImpl(this._self, this._then);

  final _PasswordPolicy _self;
  final $Res Function(_PasswordPolicy) _then;

/// Create a copy of PasswordPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiredLength = null,Object? requireUppercase = null,Object? requireLowercase = null,Object? requireDigit = null,Object? requireNonAlphanumeric = null,}) {
  return _then(_PasswordPolicy(
requiredLength: null == requiredLength ? _self.requiredLength : requiredLength // ignore: cast_nullable_to_non_nullable
as int,requireUppercase: null == requireUppercase ? _self.requireUppercase : requireUppercase // ignore: cast_nullable_to_non_nullable
as bool,requireLowercase: null == requireLowercase ? _self.requireLowercase : requireLowercase // ignore: cast_nullable_to_non_nullable
as bool,requireDigit: null == requireDigit ? _self.requireDigit : requireDigit // ignore: cast_nullable_to_non_nullable
as bool,requireNonAlphanumeric: null == requireNonAlphanumeric ? _self.requireNonAlphanumeric : requireNonAlphanumeric // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
