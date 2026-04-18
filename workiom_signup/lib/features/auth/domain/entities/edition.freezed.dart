// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Edition {

 int get id; String get displayName; bool get isRegistrable; double? get monthlyPrice; double? get annualPrice; bool get hasTrial; bool get isMostPopular;
/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditionCopyWith<Edition> get copyWith => _$EditionCopyWithImpl<Edition>(this as Edition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Edition&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isRegistrable, isRegistrable) || other.isRegistrable == isRegistrable)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.annualPrice, annualPrice) || other.annualPrice == annualPrice)&&(identical(other.hasTrial, hasTrial) || other.hasTrial == hasTrial)&&(identical(other.isMostPopular, isMostPopular) || other.isMostPopular == isMostPopular));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,isRegistrable,monthlyPrice,annualPrice,hasTrial,isMostPopular);

@override
String toString() {
  return 'Edition(id: $id, displayName: $displayName, isRegistrable: $isRegistrable, monthlyPrice: $monthlyPrice, annualPrice: $annualPrice, hasTrial: $hasTrial, isMostPopular: $isMostPopular)';
}


}

/// @nodoc
abstract mixin class $EditionCopyWith<$Res>  {
  factory $EditionCopyWith(Edition value, $Res Function(Edition) _then) = _$EditionCopyWithImpl;
@useResult
$Res call({
 int id, String displayName, bool isRegistrable, double? monthlyPrice, double? annualPrice, bool hasTrial, bool isMostPopular
});




}
/// @nodoc
class _$EditionCopyWithImpl<$Res>
    implements $EditionCopyWith<$Res> {
  _$EditionCopyWithImpl(this._self, this._then);

  final Edition _self;
  final $Res Function(Edition) _then;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? isRegistrable = null,Object? monthlyPrice = freezed,Object? annualPrice = freezed,Object? hasTrial = null,Object? isMostPopular = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isRegistrable: null == isRegistrable ? _self.isRegistrable : isRegistrable // ignore: cast_nullable_to_non_nullable
as bool,monthlyPrice: freezed == monthlyPrice ? _self.monthlyPrice : monthlyPrice // ignore: cast_nullable_to_non_nullable
as double?,annualPrice: freezed == annualPrice ? _self.annualPrice : annualPrice // ignore: cast_nullable_to_non_nullable
as double?,hasTrial: null == hasTrial ? _self.hasTrial : hasTrial // ignore: cast_nullable_to_non_nullable
as bool,isMostPopular: null == isMostPopular ? _self.isMostPopular : isMostPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Edition].
extension EditionPatterns on Edition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Edition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Edition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Edition value)  $default,){
final _that = this;
switch (_that) {
case _Edition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Edition value)?  $default,){
final _that = this;
switch (_that) {
case _Edition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String displayName,  bool isRegistrable,  double? monthlyPrice,  double? annualPrice,  bool hasTrial,  bool isMostPopular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Edition() when $default != null:
return $default(_that.id,_that.displayName,_that.isRegistrable,_that.monthlyPrice,_that.annualPrice,_that.hasTrial,_that.isMostPopular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String displayName,  bool isRegistrable,  double? monthlyPrice,  double? annualPrice,  bool hasTrial,  bool isMostPopular)  $default,) {final _that = this;
switch (_that) {
case _Edition():
return $default(_that.id,_that.displayName,_that.isRegistrable,_that.monthlyPrice,_that.annualPrice,_that.hasTrial,_that.isMostPopular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String displayName,  bool isRegistrable,  double? monthlyPrice,  double? annualPrice,  bool hasTrial,  bool isMostPopular)?  $default,) {final _that = this;
switch (_that) {
case _Edition() when $default != null:
return $default(_that.id,_that.displayName,_that.isRegistrable,_that.monthlyPrice,_that.annualPrice,_that.hasTrial,_that.isMostPopular);case _:
  return null;

}
}

}

/// @nodoc


class _Edition implements Edition {
  const _Edition({required this.id, required this.displayName, this.isRegistrable = true, this.monthlyPrice, this.annualPrice, this.hasTrial = false, this.isMostPopular = false});
  

@override final  int id;
@override final  String displayName;
@override@JsonKey() final  bool isRegistrable;
@override final  double? monthlyPrice;
@override final  double? annualPrice;
@override@JsonKey() final  bool hasTrial;
@override@JsonKey() final  bool isMostPopular;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditionCopyWith<_Edition> get copyWith => __$EditionCopyWithImpl<_Edition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Edition&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isRegistrable, isRegistrable) || other.isRegistrable == isRegistrable)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.annualPrice, annualPrice) || other.annualPrice == annualPrice)&&(identical(other.hasTrial, hasTrial) || other.hasTrial == hasTrial)&&(identical(other.isMostPopular, isMostPopular) || other.isMostPopular == isMostPopular));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,isRegistrable,monthlyPrice,annualPrice,hasTrial,isMostPopular);

@override
String toString() {
  return 'Edition(id: $id, displayName: $displayName, isRegistrable: $isRegistrable, monthlyPrice: $monthlyPrice, annualPrice: $annualPrice, hasTrial: $hasTrial, isMostPopular: $isMostPopular)';
}


}

/// @nodoc
abstract mixin class _$EditionCopyWith<$Res> implements $EditionCopyWith<$Res> {
  factory _$EditionCopyWith(_Edition value, $Res Function(_Edition) _then) = __$EditionCopyWithImpl;
@override @useResult
$Res call({
 int id, String displayName, bool isRegistrable, double? monthlyPrice, double? annualPrice, bool hasTrial, bool isMostPopular
});




}
/// @nodoc
class __$EditionCopyWithImpl<$Res>
    implements _$EditionCopyWith<$Res> {
  __$EditionCopyWithImpl(this._self, this._then);

  final _Edition _self;
  final $Res Function(_Edition) _then;

/// Create a copy of Edition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? isRegistrable = null,Object? monthlyPrice = freezed,Object? annualPrice = freezed,Object? hasTrial = null,Object? isMostPopular = null,}) {
  return _then(_Edition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isRegistrable: null == isRegistrable ? _self.isRegistrable : isRegistrable // ignore: cast_nullable_to_non_nullable
as bool,monthlyPrice: freezed == monthlyPrice ? _self.monthlyPrice : monthlyPrice // ignore: cast_nullable_to_non_nullable
as double?,annualPrice: freezed == annualPrice ? _self.annualPrice : annualPrice // ignore: cast_nullable_to_non_nullable
as double?,hasTrial: null == hasTrial ? _self.hasTrial : hasTrial // ignore: cast_nullable_to_non_nullable
as bool,isMostPopular: null == isMostPopular ? _self.isMostPopular : isMostPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
