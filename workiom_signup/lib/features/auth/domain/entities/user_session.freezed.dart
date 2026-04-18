// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSession {

 SessionUser? get user; SessionTenant? get tenant;
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionCopyWith<UserSession> get copyWith => _$UserSessionCopyWithImpl<UserSession>(this as UserSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSession&&(identical(other.user, user) || other.user == user)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}


@override
int get hashCode => Object.hash(runtimeType,user,tenant);

@override
String toString() {
  return 'UserSession(user: $user, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class $UserSessionCopyWith<$Res>  {
  factory $UserSessionCopyWith(UserSession value, $Res Function(UserSession) _then) = _$UserSessionCopyWithImpl;
@useResult
$Res call({
 SessionUser? user, SessionTenant? tenant
});


$SessionUserCopyWith<$Res>? get user;$SessionTenantCopyWith<$Res>? get tenant;

}
/// @nodoc
class _$UserSessionCopyWithImpl<$Res>
    implements $UserSessionCopyWith<$Res> {
  _$UserSessionCopyWithImpl(this._self, this._then);

  final UserSession _self;
  final $Res Function(UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? tenant = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUser?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as SessionTenant?,
  ));
}
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $SessionTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSession].
extension UserSessionPatterns on UserSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSession value)  $default,){
final _that = this;
switch (_that) {
case _UserSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSession value)?  $default,){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionUser? user,  SessionTenant? tenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionUser? user,  SessionTenant? tenant)  $default,) {final _that = this;
switch (_that) {
case _UserSession():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionUser? user,  SessionTenant? tenant)?  $default,) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
return $default(_that.user,_that.tenant);case _:
  return null;

}
}

}

/// @nodoc


class _UserSession implements UserSession {
  const _UserSession({this.user, this.tenant});
  

@override final  SessionUser? user;
@override final  SessionTenant? tenant;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionCopyWith<_UserSession> get copyWith => __$UserSessionCopyWithImpl<_UserSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSession&&(identical(other.user, user) || other.user == user)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}


@override
int get hashCode => Object.hash(runtimeType,user,tenant);

@override
String toString() {
  return 'UserSession(user: $user, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class _$UserSessionCopyWith<$Res> implements $UserSessionCopyWith<$Res> {
  factory _$UserSessionCopyWith(_UserSession value, $Res Function(_UserSession) _then) = __$UserSessionCopyWithImpl;
@override @useResult
$Res call({
 SessionUser? user, SessionTenant? tenant
});


@override $SessionUserCopyWith<$Res>? get user;@override $SessionTenantCopyWith<$Res>? get tenant;

}
/// @nodoc
class __$UserSessionCopyWithImpl<$Res>
    implements _$UserSessionCopyWith<$Res> {
  __$UserSessionCopyWithImpl(this._self, this._then);

  final _UserSession _self;
  final $Res Function(_UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? tenant = freezed,}) {
  return _then(_UserSession(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUser?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as SessionTenant?,
  ));
}

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $SessionTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}

/// @nodoc
mixin _$SessionUser {

 int get id; String get name; String get surname; String get userName; String get emailAddress;
/// Create a copy of SessionUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionUserCopyWith<SessionUser> get copyWith => _$SessionUserCopyWithImpl<SessionUser>(this as SessionUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,userName,emailAddress);

@override
String toString() {
  return 'SessionUser(id: $id, name: $name, surname: $surname, userName: $userName, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class $SessionUserCopyWith<$Res>  {
  factory $SessionUserCopyWith(SessionUser value, $Res Function(SessionUser) _then) = _$SessionUserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String surname, String userName, String emailAddress
});




}
/// @nodoc
class _$SessionUserCopyWithImpl<$Res>
    implements $SessionUserCopyWith<$Res> {
  _$SessionUserCopyWithImpl(this._self, this._then);

  final SessionUser _self;
  final $Res Function(SessionUser) _then;

/// Create a copy of SessionUser
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


/// Adds pattern-matching-related methods to [SessionUser].
extension SessionUserPatterns on SessionUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionUser value)  $default,){
final _that = this;
switch (_that) {
case _SessionUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionUser value)?  $default,){
final _that = this;
switch (_that) {
case _SessionUser() when $default != null:
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
case _SessionUser() when $default != null:
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
case _SessionUser():
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
case _SessionUser() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.userName,_that.emailAddress);case _:
  return null;

}
}

}

/// @nodoc


class _SessionUser implements SessionUser {
  const _SessionUser({required this.id, required this.name, required this.surname, required this.userName, required this.emailAddress});
  

@override final  int id;
@override final  String name;
@override final  String surname;
@override final  String userName;
@override final  String emailAddress;

/// Create a copy of SessionUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionUserCopyWith<_SessionUser> get copyWith => __$SessionUserCopyWithImpl<_SessionUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,userName,emailAddress);

@override
String toString() {
  return 'SessionUser(id: $id, name: $name, surname: $surname, userName: $userName, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class _$SessionUserCopyWith<$Res> implements $SessionUserCopyWith<$Res> {
  factory _$SessionUserCopyWith(_SessionUser value, $Res Function(_SessionUser) _then) = __$SessionUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String surname, String userName, String emailAddress
});




}
/// @nodoc
class __$SessionUserCopyWithImpl<$Res>
    implements _$SessionUserCopyWith<$Res> {
  __$SessionUserCopyWithImpl(this._self, this._then);

  final _SessionUser _self;
  final $Res Function(_SessionUser) _then;

/// Create a copy of SessionUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? surname = null,Object? userName = null,Object? emailAddress = null,}) {
  return _then(_SessionUser(
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
mixin _$SessionTenant {

 int get id; String get tenancyName; String get name;
/// Create a copy of SessionTenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionTenantCopyWith<SessionTenant> get copyWith => _$SessionTenantCopyWithImpl<SessionTenant>(this as SessionTenant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionTenant&&(identical(other.id, id) || other.id == id)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenancyName,name);

@override
String toString() {
  return 'SessionTenant(id: $id, tenancyName: $tenancyName, name: $name)';
}


}

/// @nodoc
abstract mixin class $SessionTenantCopyWith<$Res>  {
  factory $SessionTenantCopyWith(SessionTenant value, $Res Function(SessionTenant) _then) = _$SessionTenantCopyWithImpl;
@useResult
$Res call({
 int id, String tenancyName, String name
});




}
/// @nodoc
class _$SessionTenantCopyWithImpl<$Res>
    implements $SessionTenantCopyWith<$Res> {
  _$SessionTenantCopyWithImpl(this._self, this._then);

  final SessionTenant _self;
  final $Res Function(SessionTenant) _then;

/// Create a copy of SessionTenant
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


/// Adds pattern-matching-related methods to [SessionTenant].
extension SessionTenantPatterns on SessionTenant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionTenant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionTenant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionTenant value)  $default,){
final _that = this;
switch (_that) {
case _SessionTenant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionTenant value)?  $default,){
final _that = this;
switch (_that) {
case _SessionTenant() when $default != null:
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
case _SessionTenant() when $default != null:
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
case _SessionTenant():
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
case _SessionTenant() when $default != null:
return $default(_that.id,_that.tenancyName,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _SessionTenant implements SessionTenant {
  const _SessionTenant({required this.id, required this.tenancyName, required this.name});
  

@override final  int id;
@override final  String tenancyName;
@override final  String name;

/// Create a copy of SessionTenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionTenantCopyWith<_SessionTenant> get copyWith => __$SessionTenantCopyWithImpl<_SessionTenant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionTenant&&(identical(other.id, id) || other.id == id)&&(identical(other.tenancyName, tenancyName) || other.tenancyName == tenancyName)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenancyName,name);

@override
String toString() {
  return 'SessionTenant(id: $id, tenancyName: $tenancyName, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SessionTenantCopyWith<$Res> implements $SessionTenantCopyWith<$Res> {
  factory _$SessionTenantCopyWith(_SessionTenant value, $Res Function(_SessionTenant) _then) = __$SessionTenantCopyWithImpl;
@override @useResult
$Res call({
 int id, String tenancyName, String name
});




}
/// @nodoc
class __$SessionTenantCopyWithImpl<$Res>
    implements _$SessionTenantCopyWith<$Res> {
  __$SessionTenantCopyWithImpl(this._self, this._then);

  final _SessionTenant _self;
  final $Res Function(_SessionTenant) _then;

/// Create a copy of SessionTenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenancyName = null,Object? name = null,}) {
  return _then(_SessionTenant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenancyName: null == tenancyName ? _self.tenancyName : tenancyName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
