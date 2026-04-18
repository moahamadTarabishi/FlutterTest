// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditionsResultDto {

 List<EditionWithFeaturesDto> get editionsWithFeatures;
/// Create a copy of EditionsResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditionsResultDtoCopyWith<EditionsResultDto> get copyWith => _$EditionsResultDtoCopyWithImpl<EditionsResultDto>(this as EditionsResultDto, _$identity);

  /// Serializes this EditionsResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditionsResultDto&&const DeepCollectionEquality().equals(other.editionsWithFeatures, editionsWithFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(editionsWithFeatures));

@override
String toString() {
  return 'EditionsResultDto(editionsWithFeatures: $editionsWithFeatures)';
}


}

/// @nodoc
abstract mixin class $EditionsResultDtoCopyWith<$Res>  {
  factory $EditionsResultDtoCopyWith(EditionsResultDto value, $Res Function(EditionsResultDto) _then) = _$EditionsResultDtoCopyWithImpl;
@useResult
$Res call({
 List<EditionWithFeaturesDto> editionsWithFeatures
});




}
/// @nodoc
class _$EditionsResultDtoCopyWithImpl<$Res>
    implements $EditionsResultDtoCopyWith<$Res> {
  _$EditionsResultDtoCopyWithImpl(this._self, this._then);

  final EditionsResultDto _self;
  final $Res Function(EditionsResultDto) _then;

/// Create a copy of EditionsResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? editionsWithFeatures = null,}) {
  return _then(_self.copyWith(
editionsWithFeatures: null == editionsWithFeatures ? _self.editionsWithFeatures : editionsWithFeatures // ignore: cast_nullable_to_non_nullable
as List<EditionWithFeaturesDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditionsResultDto].
extension EditionsResultDtoPatterns on EditionsResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditionsResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditionsResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditionsResultDto value)  $default,){
final _that = this;
switch (_that) {
case _EditionsResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditionsResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _EditionsResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EditionWithFeaturesDto> editionsWithFeatures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditionsResultDto() when $default != null:
return $default(_that.editionsWithFeatures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EditionWithFeaturesDto> editionsWithFeatures)  $default,) {final _that = this;
switch (_that) {
case _EditionsResultDto():
return $default(_that.editionsWithFeatures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EditionWithFeaturesDto> editionsWithFeatures)?  $default,) {final _that = this;
switch (_that) {
case _EditionsResultDto() when $default != null:
return $default(_that.editionsWithFeatures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditionsResultDto implements EditionsResultDto {
  const _EditionsResultDto({final  List<EditionWithFeaturesDto> editionsWithFeatures = const []}): _editionsWithFeatures = editionsWithFeatures;
  factory _EditionsResultDto.fromJson(Map<String, dynamic> json) => _$EditionsResultDtoFromJson(json);

 final  List<EditionWithFeaturesDto> _editionsWithFeatures;
@override@JsonKey() List<EditionWithFeaturesDto> get editionsWithFeatures {
  if (_editionsWithFeatures is EqualUnmodifiableListView) return _editionsWithFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editionsWithFeatures);
}


/// Create a copy of EditionsResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditionsResultDtoCopyWith<_EditionsResultDto> get copyWith => __$EditionsResultDtoCopyWithImpl<_EditionsResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditionsResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditionsResultDto&&const DeepCollectionEquality().equals(other._editionsWithFeatures, _editionsWithFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_editionsWithFeatures));

@override
String toString() {
  return 'EditionsResultDto(editionsWithFeatures: $editionsWithFeatures)';
}


}

/// @nodoc
abstract mixin class _$EditionsResultDtoCopyWith<$Res> implements $EditionsResultDtoCopyWith<$Res> {
  factory _$EditionsResultDtoCopyWith(_EditionsResultDto value, $Res Function(_EditionsResultDto) _then) = __$EditionsResultDtoCopyWithImpl;
@override @useResult
$Res call({
 List<EditionWithFeaturesDto> editionsWithFeatures
});




}
/// @nodoc
class __$EditionsResultDtoCopyWithImpl<$Res>
    implements _$EditionsResultDtoCopyWith<$Res> {
  __$EditionsResultDtoCopyWithImpl(this._self, this._then);

  final _EditionsResultDto _self;
  final $Res Function(_EditionsResultDto) _then;

/// Create a copy of EditionsResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? editionsWithFeatures = null,}) {
  return _then(_EditionsResultDto(
editionsWithFeatures: null == editionsWithFeatures ? _self._editionsWithFeatures : editionsWithFeatures // ignore: cast_nullable_to_non_nullable
as List<EditionWithFeaturesDto>,
  ));
}


}


/// @nodoc
mixin _$EditionWithFeaturesDto {

 EditionDto get edition; List<dynamic> get featureValues;
/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditionWithFeaturesDtoCopyWith<EditionWithFeaturesDto> get copyWith => _$EditionWithFeaturesDtoCopyWithImpl<EditionWithFeaturesDto>(this as EditionWithFeaturesDto, _$identity);

  /// Serializes this EditionWithFeaturesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditionWithFeaturesDto&&(identical(other.edition, edition) || other.edition == edition)&&const DeepCollectionEquality().equals(other.featureValues, featureValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,edition,const DeepCollectionEquality().hash(featureValues));

@override
String toString() {
  return 'EditionWithFeaturesDto(edition: $edition, featureValues: $featureValues)';
}


}

/// @nodoc
abstract mixin class $EditionWithFeaturesDtoCopyWith<$Res>  {
  factory $EditionWithFeaturesDtoCopyWith(EditionWithFeaturesDto value, $Res Function(EditionWithFeaturesDto) _then) = _$EditionWithFeaturesDtoCopyWithImpl;
@useResult
$Res call({
 EditionDto edition, List<dynamic> featureValues
});


$EditionDtoCopyWith<$Res> get edition;

}
/// @nodoc
class _$EditionWithFeaturesDtoCopyWithImpl<$Res>
    implements $EditionWithFeaturesDtoCopyWith<$Res> {
  _$EditionWithFeaturesDtoCopyWithImpl(this._self, this._then);

  final EditionWithFeaturesDto _self;
  final $Res Function(EditionWithFeaturesDto) _then;

/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? edition = null,Object? featureValues = null,}) {
  return _then(_self.copyWith(
edition: null == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as EditionDto,featureValues: null == featureValues ? _self.featureValues : featureValues // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EditionDtoCopyWith<$Res> get edition {
  
  return $EditionDtoCopyWith<$Res>(_self.edition, (value) {
    return _then(_self.copyWith(edition: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditionWithFeaturesDto].
extension EditionWithFeaturesDtoPatterns on EditionWithFeaturesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditionWithFeaturesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditionWithFeaturesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditionWithFeaturesDto value)  $default,){
final _that = this;
switch (_that) {
case _EditionWithFeaturesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditionWithFeaturesDto value)?  $default,){
final _that = this;
switch (_that) {
case _EditionWithFeaturesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditionDto edition,  List<dynamic> featureValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditionWithFeaturesDto() when $default != null:
return $default(_that.edition,_that.featureValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditionDto edition,  List<dynamic> featureValues)  $default,) {final _that = this;
switch (_that) {
case _EditionWithFeaturesDto():
return $default(_that.edition,_that.featureValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditionDto edition,  List<dynamic> featureValues)?  $default,) {final _that = this;
switch (_that) {
case _EditionWithFeaturesDto() when $default != null:
return $default(_that.edition,_that.featureValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditionWithFeaturesDto implements EditionWithFeaturesDto {
  const _EditionWithFeaturesDto({required this.edition, final  List<dynamic> featureValues = const []}): _featureValues = featureValues;
  factory _EditionWithFeaturesDto.fromJson(Map<String, dynamic> json) => _$EditionWithFeaturesDtoFromJson(json);

@override final  EditionDto edition;
 final  List<dynamic> _featureValues;
@override@JsonKey() List<dynamic> get featureValues {
  if (_featureValues is EqualUnmodifiableListView) return _featureValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featureValues);
}


/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditionWithFeaturesDtoCopyWith<_EditionWithFeaturesDto> get copyWith => __$EditionWithFeaturesDtoCopyWithImpl<_EditionWithFeaturesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditionWithFeaturesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditionWithFeaturesDto&&(identical(other.edition, edition) || other.edition == edition)&&const DeepCollectionEquality().equals(other._featureValues, _featureValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,edition,const DeepCollectionEquality().hash(_featureValues));

@override
String toString() {
  return 'EditionWithFeaturesDto(edition: $edition, featureValues: $featureValues)';
}


}

/// @nodoc
abstract mixin class _$EditionWithFeaturesDtoCopyWith<$Res> implements $EditionWithFeaturesDtoCopyWith<$Res> {
  factory _$EditionWithFeaturesDtoCopyWith(_EditionWithFeaturesDto value, $Res Function(_EditionWithFeaturesDto) _then) = __$EditionWithFeaturesDtoCopyWithImpl;
@override @useResult
$Res call({
 EditionDto edition, List<dynamic> featureValues
});


@override $EditionDtoCopyWith<$Res> get edition;

}
/// @nodoc
class __$EditionWithFeaturesDtoCopyWithImpl<$Res>
    implements _$EditionWithFeaturesDtoCopyWith<$Res> {
  __$EditionWithFeaturesDtoCopyWithImpl(this._self, this._then);

  final _EditionWithFeaturesDto _self;
  final $Res Function(_EditionWithFeaturesDto) _then;

/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? edition = null,Object? featureValues = null,}) {
  return _then(_EditionWithFeaturesDto(
edition: null == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as EditionDto,featureValues: null == featureValues ? _self._featureValues : featureValues // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of EditionWithFeaturesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EditionDtoCopyWith<$Res> get edition {
  
  return $EditionDtoCopyWith<$Res>(_self.edition, (value) {
    return _then(_self.copyWith(edition: value));
  });
}
}


/// @nodoc
mixin _$EditionDto {

 int get id; String get displayName; bool get isRegistrable; double? get monthlyPrice; double? get annualPrice; bool get hasTrial; bool get isMostPopular;
/// Create a copy of EditionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditionDtoCopyWith<EditionDto> get copyWith => _$EditionDtoCopyWithImpl<EditionDto>(this as EditionDto, _$identity);

  /// Serializes this EditionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isRegistrable, isRegistrable) || other.isRegistrable == isRegistrable)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.annualPrice, annualPrice) || other.annualPrice == annualPrice)&&(identical(other.hasTrial, hasTrial) || other.hasTrial == hasTrial)&&(identical(other.isMostPopular, isMostPopular) || other.isMostPopular == isMostPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,isRegistrable,monthlyPrice,annualPrice,hasTrial,isMostPopular);

@override
String toString() {
  return 'EditionDto(id: $id, displayName: $displayName, isRegistrable: $isRegistrable, monthlyPrice: $monthlyPrice, annualPrice: $annualPrice, hasTrial: $hasTrial, isMostPopular: $isMostPopular)';
}


}

/// @nodoc
abstract mixin class $EditionDtoCopyWith<$Res>  {
  factory $EditionDtoCopyWith(EditionDto value, $Res Function(EditionDto) _then) = _$EditionDtoCopyWithImpl;
@useResult
$Res call({
 int id, String displayName, bool isRegistrable, double? monthlyPrice, double? annualPrice, bool hasTrial, bool isMostPopular
});




}
/// @nodoc
class _$EditionDtoCopyWithImpl<$Res>
    implements $EditionDtoCopyWith<$Res> {
  _$EditionDtoCopyWithImpl(this._self, this._then);

  final EditionDto _self;
  final $Res Function(EditionDto) _then;

/// Create a copy of EditionDto
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


/// Adds pattern-matching-related methods to [EditionDto].
extension EditionDtoPatterns on EditionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditionDto value)  $default,){
final _that = this;
switch (_that) {
case _EditionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditionDto value)?  $default,){
final _that = this;
switch (_that) {
case _EditionDto() when $default != null:
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
case _EditionDto() when $default != null:
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
case _EditionDto():
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
case _EditionDto() when $default != null:
return $default(_that.id,_that.displayName,_that.isRegistrable,_that.monthlyPrice,_that.annualPrice,_that.hasTrial,_that.isMostPopular);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditionDto implements EditionDto {
  const _EditionDto({required this.id, required this.displayName, this.isRegistrable = true, this.monthlyPrice, this.annualPrice, this.hasTrial = false, this.isMostPopular = false});
  factory _EditionDto.fromJson(Map<String, dynamic> json) => _$EditionDtoFromJson(json);

@override final  int id;
@override final  String displayName;
@override@JsonKey() final  bool isRegistrable;
@override final  double? monthlyPrice;
@override final  double? annualPrice;
@override@JsonKey() final  bool hasTrial;
@override@JsonKey() final  bool isMostPopular;

/// Create a copy of EditionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditionDtoCopyWith<_EditionDto> get copyWith => __$EditionDtoCopyWithImpl<_EditionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isRegistrable, isRegistrable) || other.isRegistrable == isRegistrable)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.annualPrice, annualPrice) || other.annualPrice == annualPrice)&&(identical(other.hasTrial, hasTrial) || other.hasTrial == hasTrial)&&(identical(other.isMostPopular, isMostPopular) || other.isMostPopular == isMostPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,isRegistrable,monthlyPrice,annualPrice,hasTrial,isMostPopular);

@override
String toString() {
  return 'EditionDto(id: $id, displayName: $displayName, isRegistrable: $isRegistrable, monthlyPrice: $monthlyPrice, annualPrice: $annualPrice, hasTrial: $hasTrial, isMostPopular: $isMostPopular)';
}


}

/// @nodoc
abstract mixin class _$EditionDtoCopyWith<$Res> implements $EditionDtoCopyWith<$Res> {
  factory _$EditionDtoCopyWith(_EditionDto value, $Res Function(_EditionDto) _then) = __$EditionDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String displayName, bool isRegistrable, double? monthlyPrice, double? annualPrice, bool hasTrial, bool isMostPopular
});




}
/// @nodoc
class __$EditionDtoCopyWithImpl<$Res>
    implements _$EditionDtoCopyWith<$Res> {
  __$EditionDtoCopyWithImpl(this._self, this._then);

  final _EditionDto _self;
  final $Res Function(_EditionDto) _then;

/// Create a copy of EditionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? isRegistrable = null,Object? monthlyPrice = freezed,Object? annualPrice = freezed,Object? hasTrial = null,Object? isMostPopular = null,}) {
  return _then(_EditionDto(
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
