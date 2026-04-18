// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthFailureGeneric value)?  generic,TResult Function( AuthFailureTenantTaken value)?  tenantTaken,TResult Function( AuthFailureInvalidCredentials value)?  invalidCredentials,TResult Function( AuthFailureValidation value)?  validation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthFailureGeneric() when generic != null:
return generic(_that);case AuthFailureTenantTaken() when tenantTaken != null:
return tenantTaken(_that);case AuthFailureInvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case AuthFailureValidation() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthFailureGeneric value)  generic,required TResult Function( AuthFailureTenantTaken value)  tenantTaken,required TResult Function( AuthFailureInvalidCredentials value)  invalidCredentials,required TResult Function( AuthFailureValidation value)  validation,}){
final _that = this;
switch (_that) {
case AuthFailureGeneric():
return generic(_that);case AuthFailureTenantTaken():
return tenantTaken(_that);case AuthFailureInvalidCredentials():
return invalidCredentials(_that);case AuthFailureValidation():
return validation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthFailureGeneric value)?  generic,TResult? Function( AuthFailureTenantTaken value)?  tenantTaken,TResult? Function( AuthFailureInvalidCredentials value)?  invalidCredentials,TResult? Function( AuthFailureValidation value)?  validation,}){
final _that = this;
switch (_that) {
case AuthFailureGeneric() when generic != null:
return generic(_that);case AuthFailureTenantTaken() when tenantTaken != null:
return tenantTaken(_that);case AuthFailureInvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case AuthFailureValidation() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Failure failure)?  generic,TResult Function()?  tenantTaken,TResult Function()?  invalidCredentials,TResult Function( Map<String, String> fieldErrors)?  validation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthFailureGeneric() when generic != null:
return generic(_that.failure);case AuthFailureTenantTaken() when tenantTaken != null:
return tenantTaken();case AuthFailureInvalidCredentials() when invalidCredentials != null:
return invalidCredentials();case AuthFailureValidation() when validation != null:
return validation(_that.fieldErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Failure failure)  generic,required TResult Function()  tenantTaken,required TResult Function()  invalidCredentials,required TResult Function( Map<String, String> fieldErrors)  validation,}) {final _that = this;
switch (_that) {
case AuthFailureGeneric():
return generic(_that.failure);case AuthFailureTenantTaken():
return tenantTaken();case AuthFailureInvalidCredentials():
return invalidCredentials();case AuthFailureValidation():
return validation(_that.fieldErrors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Failure failure)?  generic,TResult? Function()?  tenantTaken,TResult? Function()?  invalidCredentials,TResult? Function( Map<String, String> fieldErrors)?  validation,}) {final _that = this;
switch (_that) {
case AuthFailureGeneric() when generic != null:
return generic(_that.failure);case AuthFailureTenantTaken() when tenantTaken != null:
return tenantTaken();case AuthFailureInvalidCredentials() when invalidCredentials != null:
return invalidCredentials();case AuthFailureValidation() when validation != null:
return validation(_that.fieldErrors);case _:
  return null;

}
}

}

/// @nodoc


class AuthFailureGeneric implements AuthFailure {
  const AuthFailureGeneric(this.failure);
  

 final  Failure failure;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureGenericCopyWith<AuthFailureGeneric> get copyWith => _$AuthFailureGenericCopyWithImpl<AuthFailureGeneric>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureGeneric&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthFailure.generic(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthFailureGenericCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $AuthFailureGenericCopyWith(AuthFailureGeneric value, $Res Function(AuthFailureGeneric) _then) = _$AuthFailureGenericCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$AuthFailureGenericCopyWithImpl<$Res>
    implements $AuthFailureGenericCopyWith<$Res> {
  _$AuthFailureGenericCopyWithImpl(this._self, this._then);

  final AuthFailureGeneric _self;
  final $Res Function(AuthFailureGeneric) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AuthFailureGeneric(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class AuthFailureTenantTaken implements AuthFailure {
  const AuthFailureTenantTaken();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureTenantTaken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.tenantTaken()';
}


}




/// @nodoc


class AuthFailureInvalidCredentials implements AuthFailure {
  const AuthFailureInvalidCredentials();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureInvalidCredentials);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidCredentials()';
}


}




/// @nodoc


class AuthFailureValidation implements AuthFailure {
  const AuthFailureValidation(final  Map<String, String> fieldErrors): _fieldErrors = fieldErrors;
  

 final  Map<String, String> _fieldErrors;
 Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}


/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureValidationCopyWith<AuthFailureValidation> get copyWith => _$AuthFailureValidationCopyWithImpl<AuthFailureValidation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureValidation&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'AuthFailure.validation(fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $AuthFailureValidationCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $AuthFailureValidationCopyWith(AuthFailureValidation value, $Res Function(AuthFailureValidation) _then) = _$AuthFailureValidationCopyWithImpl;
@useResult
$Res call({
 Map<String, String> fieldErrors
});




}
/// @nodoc
class _$AuthFailureValidationCopyWithImpl<$Res>
    implements $AuthFailureValidationCopyWith<$Res> {
  _$AuthFailureValidationCopyWithImpl(this._self, this._then);

  final AuthFailureValidation _self;
  final $Res Function(AuthFailureValidation) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldErrors = null,}) {
  return _then(AuthFailureValidation(
null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
