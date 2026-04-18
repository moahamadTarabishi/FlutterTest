// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValueFailure<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailure<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ValueFailure<$T>()';
}


}

/// @nodoc
class $ValueFailureCopyWith<T,$Res>  {
$ValueFailureCopyWith(ValueFailure<T> _, $Res Function(ValueFailure<T>) __);
}


/// Adds pattern-matching-related methods to [ValueFailure].
extension ValueFailurePatterns<T> on ValueFailure<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ValueFailureEmpty<T> value)?  empty,TResult Function( ValueFailureInvalidEmail<T> value)?  invalidEmail,TResult Function( ValueFailureInvalidTenantName<T> value)?  invalidTenantName,TResult Function( ValueFailureInvalidLength<T> value)?  invalidLength,TResult Function( ValueFailureLettersOnly<T> value)?  lettersOnly,TResult Function( ValueFailureWeakPassword<T> value)?  weakPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ValueFailureEmpty() when empty != null:
return empty(_that);case ValueFailureInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case ValueFailureInvalidTenantName() when invalidTenantName != null:
return invalidTenantName(_that);case ValueFailureInvalidLength() when invalidLength != null:
return invalidLength(_that);case ValueFailureLettersOnly() when lettersOnly != null:
return lettersOnly(_that);case ValueFailureWeakPassword() when weakPassword != null:
return weakPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ValueFailureEmpty<T> value)  empty,required TResult Function( ValueFailureInvalidEmail<T> value)  invalidEmail,required TResult Function( ValueFailureInvalidTenantName<T> value)  invalidTenantName,required TResult Function( ValueFailureInvalidLength<T> value)  invalidLength,required TResult Function( ValueFailureLettersOnly<T> value)  lettersOnly,required TResult Function( ValueFailureWeakPassword<T> value)  weakPassword,}){
final _that = this;
switch (_that) {
case ValueFailureEmpty():
return empty(_that);case ValueFailureInvalidEmail():
return invalidEmail(_that);case ValueFailureInvalidTenantName():
return invalidTenantName(_that);case ValueFailureInvalidLength():
return invalidLength(_that);case ValueFailureLettersOnly():
return lettersOnly(_that);case ValueFailureWeakPassword():
return weakPassword(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ValueFailureEmpty<T> value)?  empty,TResult? Function( ValueFailureInvalidEmail<T> value)?  invalidEmail,TResult? Function( ValueFailureInvalidTenantName<T> value)?  invalidTenantName,TResult? Function( ValueFailureInvalidLength<T> value)?  invalidLength,TResult? Function( ValueFailureLettersOnly<T> value)?  lettersOnly,TResult? Function( ValueFailureWeakPassword<T> value)?  weakPassword,}){
final _that = this;
switch (_that) {
case ValueFailureEmpty() when empty != null:
return empty(_that);case ValueFailureInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case ValueFailureInvalidTenantName() when invalidTenantName != null:
return invalidTenantName(_that);case ValueFailureInvalidLength() when invalidLength != null:
return invalidLength(_that);case ValueFailureLettersOnly() when lettersOnly != null:
return lettersOnly(_that);case ValueFailureWeakPassword() when weakPassword != null:
return weakPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( T failedValue)?  invalidEmail,TResult Function( T failedValue)?  invalidTenantName,TResult Function( T failedValue)?  invalidLength,TResult Function( T failedValue)?  lettersOnly,TResult Function()?  weakPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ValueFailureEmpty() when empty != null:
return empty();case ValueFailureInvalidEmail() when invalidEmail != null:
return invalidEmail(_that.failedValue);case ValueFailureInvalidTenantName() when invalidTenantName != null:
return invalidTenantName(_that.failedValue);case ValueFailureInvalidLength() when invalidLength != null:
return invalidLength(_that.failedValue);case ValueFailureLettersOnly() when lettersOnly != null:
return lettersOnly(_that.failedValue);case ValueFailureWeakPassword() when weakPassword != null:
return weakPassword();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( T failedValue)  invalidEmail,required TResult Function( T failedValue)  invalidTenantName,required TResult Function( T failedValue)  invalidLength,required TResult Function( T failedValue)  lettersOnly,required TResult Function()  weakPassword,}) {final _that = this;
switch (_that) {
case ValueFailureEmpty():
return empty();case ValueFailureInvalidEmail():
return invalidEmail(_that.failedValue);case ValueFailureInvalidTenantName():
return invalidTenantName(_that.failedValue);case ValueFailureInvalidLength():
return invalidLength(_that.failedValue);case ValueFailureLettersOnly():
return lettersOnly(_that.failedValue);case ValueFailureWeakPassword():
return weakPassword();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( T failedValue)?  invalidEmail,TResult? Function( T failedValue)?  invalidTenantName,TResult? Function( T failedValue)?  invalidLength,TResult? Function( T failedValue)?  lettersOnly,TResult? Function()?  weakPassword,}) {final _that = this;
switch (_that) {
case ValueFailureEmpty() when empty != null:
return empty();case ValueFailureInvalidEmail() when invalidEmail != null:
return invalidEmail(_that.failedValue);case ValueFailureInvalidTenantName() when invalidTenantName != null:
return invalidTenantName(_that.failedValue);case ValueFailureInvalidLength() when invalidLength != null:
return invalidLength(_that.failedValue);case ValueFailureLettersOnly() when lettersOnly != null:
return lettersOnly(_that.failedValue);case ValueFailureWeakPassword() when weakPassword != null:
return weakPassword();case _:
  return null;

}
}

}

/// @nodoc


class ValueFailureEmpty<T> implements ValueFailure<T> {
  const ValueFailureEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureEmpty<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ValueFailure<$T>.empty()';
}


}




/// @nodoc


class ValueFailureInvalidEmail<T> implements ValueFailure<T> {
  const ValueFailureInvalidEmail({required this.failedValue});
  

 final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureInvalidEmailCopyWith<T, ValueFailureInvalidEmail<T>> get copyWith => _$ValueFailureInvalidEmailCopyWithImpl<T, ValueFailureInvalidEmail<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureInvalidEmail<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ValueFailureInvalidEmailCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureInvalidEmailCopyWith(ValueFailureInvalidEmail<T> value, $Res Function(ValueFailureInvalidEmail<T>) _then) = _$ValueFailureInvalidEmailCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ValueFailureInvalidEmailCopyWithImpl<T,$Res>
    implements $ValueFailureInvalidEmailCopyWith<T, $Res> {
  _$ValueFailureInvalidEmailCopyWithImpl(this._self, this._then);

  final ValueFailureInvalidEmail<T> _self;
  final $Res Function(ValueFailureInvalidEmail<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(ValueFailureInvalidEmail<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ValueFailureInvalidTenantName<T> implements ValueFailure<T> {
  const ValueFailureInvalidTenantName({required this.failedValue});
  

 final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureInvalidTenantNameCopyWith<T, ValueFailureInvalidTenantName<T>> get copyWith => _$ValueFailureInvalidTenantNameCopyWithImpl<T, ValueFailureInvalidTenantName<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureInvalidTenantName<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidTenantName(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ValueFailureInvalidTenantNameCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureInvalidTenantNameCopyWith(ValueFailureInvalidTenantName<T> value, $Res Function(ValueFailureInvalidTenantName<T>) _then) = _$ValueFailureInvalidTenantNameCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ValueFailureInvalidTenantNameCopyWithImpl<T,$Res>
    implements $ValueFailureInvalidTenantNameCopyWith<T, $Res> {
  _$ValueFailureInvalidTenantNameCopyWithImpl(this._self, this._then);

  final ValueFailureInvalidTenantName<T> _self;
  final $Res Function(ValueFailureInvalidTenantName<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(ValueFailureInvalidTenantName<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ValueFailureInvalidLength<T> implements ValueFailure<T> {
  const ValueFailureInvalidLength({required this.failedValue});
  

 final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureInvalidLengthCopyWith<T, ValueFailureInvalidLength<T>> get copyWith => _$ValueFailureInvalidLengthCopyWithImpl<T, ValueFailureInvalidLength<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureInvalidLength<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidLength(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ValueFailureInvalidLengthCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureInvalidLengthCopyWith(ValueFailureInvalidLength<T> value, $Res Function(ValueFailureInvalidLength<T>) _then) = _$ValueFailureInvalidLengthCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ValueFailureInvalidLengthCopyWithImpl<T,$Res>
    implements $ValueFailureInvalidLengthCopyWith<T, $Res> {
  _$ValueFailureInvalidLengthCopyWithImpl(this._self, this._then);

  final ValueFailureInvalidLength<T> _self;
  final $Res Function(ValueFailureInvalidLength<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(ValueFailureInvalidLength<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ValueFailureLettersOnly<T> implements ValueFailure<T> {
  const ValueFailureLettersOnly({required this.failedValue});
  

 final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureLettersOnlyCopyWith<T, ValueFailureLettersOnly<T>> get copyWith => _$ValueFailureLettersOnlyCopyWithImpl<T, ValueFailureLettersOnly<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureLettersOnly<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.lettersOnly(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ValueFailureLettersOnlyCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureLettersOnlyCopyWith(ValueFailureLettersOnly<T> value, $Res Function(ValueFailureLettersOnly<T>) _then) = _$ValueFailureLettersOnlyCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ValueFailureLettersOnlyCopyWithImpl<T,$Res>
    implements $ValueFailureLettersOnlyCopyWith<T, $Res> {
  _$ValueFailureLettersOnlyCopyWithImpl(this._self, this._then);

  final ValueFailureLettersOnly<T> _self;
  final $Res Function(ValueFailureLettersOnly<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(ValueFailureLettersOnly<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ValueFailureWeakPassword<T> implements ValueFailure<T> {
  const ValueFailureWeakPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailureWeakPassword<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ValueFailure<$T>.weakPassword()';
}


}




// dart format on
