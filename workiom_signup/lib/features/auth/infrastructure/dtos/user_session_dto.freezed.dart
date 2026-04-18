// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSessionResultDto {

 SessionUserDto? get user; SessionTenantDto? get tenant;
/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionResultDtoCopyWith<UserSessionResultDto> get copyWith => _$UserSessionResultDtoCopyWithImpl<UserSessionResultDto>(this as UserSessionResultDto, _$identity);

  /// Serializes this UserSessionResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSessionResultDto&&(identical(other.user, user) || other.user == user)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,tenant);

@override
String toString() {
  return 'UserSessionResultDto(user: $user, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class $UserSessionResultDtoCopyWith<$Res>  {
  factory $UserSessionResultDtoCopyWith(UserSessionResultDto value, $Res Function(UserSessionResultDto) _then) = _$UserSessionResultDtoCopyWithImpl;
@useResult
$Res call({
 SessionUserDto? user, SessionTenantDto? tenant
});


$SessionUserDtoCopyWith<$Res>? get user;$SessionTenantDtoCopyWith<$Res>? get tenant;

}
/// @nodoc
class _$UserSessionResultDtoCopyWithImpl<$Res>
    implements $UserSessionResultDtoCopyWith<$Res> {
  _$UserSessionResultDtoCopyWithImpl(this._self, this._then);

  final UserSessionResultDto _self;
  final $Res Function(UserSessionResultDto) _then;

/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? tenant = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUserDto?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as SessionTenantDto?,
  ));
}
/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionTenantDtoCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $SessionTenantDtoCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSessionResultDto].
extension UserSessionResultDtoPatterns on UserSessionResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSessionResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSessionResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSessionResultDto value)  $default,){
final _that = this;
switch (_that) {
case _UserSessionResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSessionResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserSessionResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionUserDto? user,  SessionTenantDto? tenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSessionResultDto() when $default != null:
return $default(_that.user,_that.tenant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionUserDto? user,  SessionTenantDto? tenant)  $default,) {final _that = this;
switch (_that) {
case _UserSessionResultDto():
return $default(_that.user,_that.tenant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionUserDto? user,  SessionTenantDto? tenant)?  $default,) {final _that = this;
switch (_that) {
case _UserSessionResultDto() when $default != null:
return $default(_that.user,_that.tenant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSessionResultDto implements UserSessionResultDto {
  const _UserSessionResultDto({this.user, this.tenant});
  factory _UserSessionResultDto.fromJson(Map<String, dynamic> json) => _$UserSessionResultDtoFromJson(json);

@override final  SessionUserDto? user;
@override final  SessionTenantDto? tenant;

/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionResultDtoCopyWith<_UserSessionResultDto> get copyWith => __$UserSessionResultDtoCopyWithImpl<_UserSessionResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSessionResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSessionResultDto&&(identical(other.user, user) || other.user == user)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,tenant);

@override
String toString() {
  return 'UserSessionResultDto(user: $user, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class _$UserSessionResultDtoCopyWith<$Res> implements $UserSessionResultDtoCopyWith<$Res> {
  factory _$UserSessionResultDtoCopyWith(_UserSessionResultDto value, $Res Function(_UserSessionResultDto) _then) = __$UserSessionResultDtoCopyWithImpl;
@override @useResult
$Res call({
 SessionUserDto? user, SessionTenantDto? tenant
});


@override $SessionUserDtoCopyWith<$Res>? get user;@override $SessionTenantDtoCopyWith<$Res>? get tenant;

}
/// @nodoc
class __$UserSessionResultDtoCopyWithImpl<$Res>
    implements _$UserSessionResultDtoCopyWith<$Res> {
  __$UserSessionResultDtoCopyWithImpl(this._self, this._then);

  final _UserSessionResultDto _self;
  final $Res Function(_UserSessionResultDto) _then;

/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? tenant = freezed,}) {
  return _then(_UserSessionResultDto(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUserDto?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as SessionTenantDto?,
  ));
}

/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserSessionResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionTenantDtoCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $SessionTenantDtoCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// @nodoc
mixin _$SessionUserDto {

 int get id; String get name; String get surname; String get userName; String get emailAddress;
/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<SessionUserDto> get copyWith => _$SessionUserDtoCopyWithImpl<SessionUserDto>(this as SessionUserDto, _$identity);

  /// Serializes this SessionUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,surname,userName,emailAddress);

@override
String toString() {
  return 'SessionUserDto(id: $id, name: $name, surname: $surname, userName: $userName, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class $SessionUserDtoCopyWith<$Res>  {
  factory $SessionUserDtoCopyWith(SessionUserDto value, $Res Function(SessionUserDto) _then) = _$SessionUserDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String surname, String userName, String emailAddress
});




}
/// @nodoc
class _$SessionUserDtoCopyWithImpl<$Res>
    implements $SessionUserDtoCopyWith<$Res> {
  _$SessionUserDtoCopyWithImpl(this._self, this._then);

  final SessionUserDto _self;
  final $Res Function(SessionUserDto) _then;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? surname = null,Object? userName = null,Object? emailAddress = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,emailAddress: null == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionUserDto].
extension SessionUserDtoPatterns on SessionUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionUserDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String surname,  String userName,  String emailAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.userName,_that.emailAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String surname,  String userName,  String emailAddress)  $default,) {final _that = this;
switch (_that) {
case _SessionUserDto():
return $default(_that.id,_that.name,_that.surname,_that.userName,_that.emailAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String surname,  String userName,  String emailAddress)?  $default,) {final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.userName,_that.emailAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionUserDto implements SessionUserDto {
  const _SessionUserDto({required this.id, required this.name, required this.surname, required this.userName, required this.emailAddress});
  factory _SessionUserDto.fromJson(Map<String, dynamic> json) => _$SessionUserDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String surname;
@override final  String userName;
@override final  String emailAddress;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionUserDtoCopyWith<_SessionUserDto> get copyWith => __$SessionUserDtoCopyWithImpl<_SessionUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,surname,userName,emailAddress);

@override
String toString() {
  return 'SessionUserDto(id: $id, name: $name, surname: $surname, userName: $userName, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class _$SessionUserDtoCopyWith<$Res> implements $SessionUserDtoCopyWith<$Res> {
  factory _$SessionUserDtoCopyWith(_SessionUserDto value, $Res Function(_SessionUserDto) _then) = __$SessionUserDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String surname, String userName, String emailAddress
});




}
/// @nodoc
class __$SessionUserDtoCopyWithImpl<$Res>
    implements _$SessionUserDtoCopyWith<$Res> {
  __$SessionUserDtoCopyWithImpl(this._self, this._then);

  final _SessionUserDto _self;
  final $Res Function(_SessionUserDto) _then;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? surname = null,Object? userName = null,Object? emailAddress = null,}) {
  return _then(_SessionUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,emailAddress: null == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SessionTenantDto {

 int get id; String get tenancyName; String get name;
/// Create a copy of SessionTenantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionTenantDtoCopyWith<SessionTenantDto> get copyWith => _$SessionTenantDtoCopyWithImpl<SessionTenantDto>(this as SessionTenantDto, _$identity);

  /// Serializes this SessionTenantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionTenantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenancyName,name);

@override
String toString() {
  return 'SessionTenantDto(id: $id, tenancyName: $tenancyName, name: $name)';
}


}

/// @nodoc
abstract mixin class $SessionTenantDtoCopyWith<$Res>  {
  factory $SessionTenantDtoCopyWith(SessionTenantDto value, $Res Function(SessionTenantDto) _then) = _$SessionTenantDtoCopyWithImpl;
@useResult
$Res call({
 int id, String tenancyName, String name
});




}
/// @nodoc
class _$SessionTenantDtoCopyWithImpl<$Res>
    implements $SessionTenantDtoCopyWith<$Res> {
  _$SessionTenantDtoCopyWithImpl(this._self, this._then);

  final SessionTenantDto _self;
  final $Res Function(SessionTenantDto) _then;

/// Create a copy of SessionTenantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenancyName = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionTenantDto].
extension SessionTenantDtoPatterns on SessionTenantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionTenantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionTenantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionTenantDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionTenantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionTenantDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionTenantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tenancyName,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionTenantDto() when $default != null:
return $default(_that.id,_that.tenancyName,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tenancyName,  String name)  $default,) {final _that = this;
switch (_that) {
case _SessionTenantDto():
return $default(_that.id,_that.tenancyName,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tenancyName,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SessionTenantDto() when $default != null:
return $default(_that.id,_that.tenancyName,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionTenantDto implements SessionTenantDto {
  const _SessionTenantDto({required this.id, required this.tenancyName, required this.name});
  factory _SessionTenantDto.fromJson(Map<String, dynamic> json) => _$SessionTenantDtoFromJson(json);

@override final  int id;
@override final  String tenancyName;
@override final  String name;

/// Create a copy of SessionTenantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionTenantDtoCopyWith<_SessionTenantDto> get copyWith => __$SessionTenantDtoCopyWithImpl<_SessionTenantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionTenantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionTenantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenancyName,name);

@override
String toString() {
  return 'SessionTenantDto(id: $id, tenancyName: $tenancyName, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SessionTenantDtoCopyWith<$Res> implements $SessionTenantDtoCopyWith<$Res> {
  factory _$SessionTenantDtoCopyWith(_SessionTenantDto value, $Res Function(_SessionTenantDto) _then) = __$SessionTenantDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String tenancyName, String name
});




}
/// @nodoc
class __$SessionTenantDtoCopyWithImpl<$Res>
    implements _$SessionTenantDtoCopyWith<$Res> {
  __$SessionTenantDtoCopyWithImpl(this._self, this._then);

  final _SessionTenantDto _self;
  final $Res Function(_SessionTenantDto) _then;

/// Create a copy of SessionTenantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenancyName = null,Object? name = null,}) {
  return _then(_SessionTenantDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
