// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent()';
}


}

/// @nodoc
class $SignInEventCopyWith<$Res>  {
$SignInEventCopyWith(SignInEvent _, $Res Function(SignInEvent) __);
}


/// Adds pattern-matching-related methods to [SignInEvent].
extension SignInEventPatterns on SignInEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInStarted value)?  started,TResult Function( SignInWorkspaceChanged value)?  workspaceChanged,TResult Function( SignInEmailChanged value)?  emailChanged,TResult Function( SignInPasswordChanged value)?  passwordChanged,TResult Function( SignInPasswordVisibilityToggled value)?  passwordVisibilityToggled,TResult Function( SignInSubmitted value)?  submitted,TResult Function( SignInReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInStarted() when started != null:
return started(_that);case SignInWorkspaceChanged() when workspaceChanged != null:
return workspaceChanged(_that);case SignInEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignInPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case SignInPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled(_that);case SignInSubmitted() when submitted != null:
return submitted(_that);case SignInReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInStarted value)  started,required TResult Function( SignInWorkspaceChanged value)  workspaceChanged,required TResult Function( SignInEmailChanged value)  emailChanged,required TResult Function( SignInPasswordChanged value)  passwordChanged,required TResult Function( SignInPasswordVisibilityToggled value)  passwordVisibilityToggled,required TResult Function( SignInSubmitted value)  submitted,required TResult Function( SignInReset value)  reset,}){
final _that = this;
switch (_that) {
case SignInStarted():
return started(_that);case SignInWorkspaceChanged():
return workspaceChanged(_that);case SignInEmailChanged():
return emailChanged(_that);case SignInPasswordChanged():
return passwordChanged(_that);case SignInPasswordVisibilityToggled():
return passwordVisibilityToggled(_that);case SignInSubmitted():
return submitted(_that);case SignInReset():
return reset(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInStarted value)?  started,TResult? Function( SignInWorkspaceChanged value)?  workspaceChanged,TResult? Function( SignInEmailChanged value)?  emailChanged,TResult? Function( SignInPasswordChanged value)?  passwordChanged,TResult? Function( SignInPasswordVisibilityToggled value)?  passwordVisibilityToggled,TResult? Function( SignInSubmitted value)?  submitted,TResult? Function( SignInReset value)?  reset,}){
final _that = this;
switch (_that) {
case SignInStarted() when started != null:
return started(_that);case SignInWorkspaceChanged() when workspaceChanged != null:
return workspaceChanged(_that);case SignInEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignInPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case SignInPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled(_that);case SignInSubmitted() when submitted != null:
return submitted(_that);case SignInReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String tenantName)?  workspaceChanged,TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function()?  passwordVisibilityToggled,TResult Function()?  submitted,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignInStarted() when started != null:
return started();case SignInWorkspaceChanged() when workspaceChanged != null:
return workspaceChanged(_that.tenantName);case SignInEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignInPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case SignInPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled();case SignInSubmitted() when submitted != null:
return submitted();case SignInReset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String tenantName)  workspaceChanged,required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function()  passwordVisibilityToggled,required TResult Function()  submitted,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case SignInStarted():
return started();case SignInWorkspaceChanged():
return workspaceChanged(_that.tenantName);case SignInEmailChanged():
return emailChanged(_that.email);case SignInPasswordChanged():
return passwordChanged(_that.password);case SignInPasswordVisibilityToggled():
return passwordVisibilityToggled();case SignInSubmitted():
return submitted();case SignInReset():
return reset();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String tenantName)?  workspaceChanged,TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function()?  passwordVisibilityToggled,TResult? Function()?  submitted,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case SignInStarted() when started != null:
return started();case SignInWorkspaceChanged() when workspaceChanged != null:
return workspaceChanged(_that.tenantName);case SignInEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignInPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case SignInPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled();case SignInSubmitted() when submitted != null:
return submitted();case SignInReset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class SignInStarted implements SignInEvent {
  const SignInStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent.started()';
}


}




/// @nodoc


class SignInWorkspaceChanged implements SignInEvent {
  const SignInWorkspaceChanged(this.tenantName);
  

 final  String tenantName;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInWorkspaceChangedCopyWith<SignInWorkspaceChanged> get copyWith => _$SignInWorkspaceChangedCopyWithImpl<SignInWorkspaceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWorkspaceChanged&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName));
}


@override
int get hashCode => Object.hash(runtimeType,tenantName);

@override
String toString() {
  return 'SignInEvent.workspaceChanged(tenantName: $tenantName)';
}


}

/// @nodoc
abstract mixin class $SignInWorkspaceChangedCopyWith<$Res> implements $SignInEventCopyWith<$Res> {
  factory $SignInWorkspaceChangedCopyWith(SignInWorkspaceChanged value, $Res Function(SignInWorkspaceChanged) _then) = _$SignInWorkspaceChangedCopyWithImpl;
@useResult
$Res call({
 String tenantName
});




}
/// @nodoc
class _$SignInWorkspaceChangedCopyWithImpl<$Res>
    implements $SignInWorkspaceChangedCopyWith<$Res> {
  _$SignInWorkspaceChangedCopyWithImpl(this._self, this._then);

  final SignInWorkspaceChanged _self;
  final $Res Function(SignInWorkspaceChanged) _then;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tenantName = null,}) {
  return _then(SignInWorkspaceChanged(
null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignInEmailChanged implements SignInEvent {
  const SignInEmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInEmailChangedCopyWith<SignInEmailChanged> get copyWith => _$SignInEmailChangedCopyWithImpl<SignInEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignInEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignInEmailChangedCopyWith<$Res> implements $SignInEventCopyWith<$Res> {
  factory $SignInEmailChangedCopyWith(SignInEmailChanged value, $Res Function(SignInEmailChanged) _then) = _$SignInEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignInEmailChangedCopyWithImpl<$Res>
    implements $SignInEmailChangedCopyWith<$Res> {
  _$SignInEmailChangedCopyWithImpl(this._self, this._then);

  final SignInEmailChanged _self;
  final $Res Function(SignInEmailChanged) _then;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignInEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignInPasswordChanged implements SignInEvent {
  const SignInPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInPasswordChangedCopyWith<SignInPasswordChanged> get copyWith => _$SignInPasswordChangedCopyWithImpl<SignInPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SignInEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $SignInPasswordChangedCopyWith<$Res> implements $SignInEventCopyWith<$Res> {
  factory $SignInPasswordChangedCopyWith(SignInPasswordChanged value, $Res Function(SignInPasswordChanged) _then) = _$SignInPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$SignInPasswordChangedCopyWithImpl<$Res>
    implements $SignInPasswordChangedCopyWith<$Res> {
  _$SignInPasswordChangedCopyWithImpl(this._self, this._then);

  final SignInPasswordChanged _self;
  final $Res Function(SignInPasswordChanged) _then;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(SignInPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignInPasswordVisibilityToggled implements SignInEvent {
  const SignInPasswordVisibilityToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInPasswordVisibilityToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent.passwordVisibilityToggled()';
}


}




/// @nodoc


class SignInSubmitted implements SignInEvent {
  const SignInSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent.submitted()';
}


}




/// @nodoc


class SignInReset implements SignInEvent {
  const SignInReset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent.reset()';
}


}




/// @nodoc
mixin _$SignInState {

 TenantName get workspace; EmailAddress get email; Password get password; bool get obscurePassword; SignInSubmissionStatus get submissionStatus; AuthFailure? get failure; UserSession? get userSession;
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.workspace, workspace) || other.workspace == workspace)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.userSession, userSession) || other.userSession == userSession));
}


@override
int get hashCode => Object.hash(runtimeType,workspace,email,password,obscurePassword,submissionStatus,failure,userSession);

@override
String toString() {
  return 'SignInState(workspace: $workspace, email: $email, password: $password, obscurePassword: $obscurePassword, submissionStatus: $submissionStatus, failure: $failure, userSession: $userSession)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res>  {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@useResult
$Res call({
 TenantName workspace, EmailAddress email, Password password, bool obscurePassword, SignInSubmissionStatus submissionStatus, AuthFailure? failure, UserSession? userSession
});


$AuthFailureCopyWith<$Res>? get failure;$UserSessionCopyWith<$Res>? get userSession;

}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspace = null,Object? email = null,Object? password = null,Object? obscurePassword = null,Object? submissionStatus = null,Object? failure = freezed,Object? userSession = freezed,}) {
  return _then(_self.copyWith(
workspace: null == workspace ? _self.workspace : workspace // ignore: cast_nullable_to_non_nullable
as TenantName,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailAddress,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SignInSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,userSession: freezed == userSession ? _self.userSession : userSession // ignore: cast_nullable_to_non_nullable
as UserSession?,
  ));
}
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $AuthFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSessionCopyWith<$Res>? get userSession {
    if (_self.userSession == null) {
    return null;
  }

  return $UserSessionCopyWith<$Res>(_self.userSession!, (value) {
    return _then(_self.copyWith(userSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInState value)  $default,){
final _that = this;
switch (_that) {
case _SignInState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInState value)?  $default,){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TenantName workspace,  EmailAddress email,  Password password,  bool obscurePassword,  SignInSubmissionStatus submissionStatus,  AuthFailure? failure,  UserSession? userSession)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.workspace,_that.email,_that.password,_that.obscurePassword,_that.submissionStatus,_that.failure,_that.userSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TenantName workspace,  EmailAddress email,  Password password,  bool obscurePassword,  SignInSubmissionStatus submissionStatus,  AuthFailure? failure,  UserSession? userSession)  $default,) {final _that = this;
switch (_that) {
case _SignInState():
return $default(_that.workspace,_that.email,_that.password,_that.obscurePassword,_that.submissionStatus,_that.failure,_that.userSession);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TenantName workspace,  EmailAddress email,  Password password,  bool obscurePassword,  SignInSubmissionStatus submissionStatus,  AuthFailure? failure,  UserSession? userSession)?  $default,) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.workspace,_that.email,_that.password,_that.obscurePassword,_that.submissionStatus,_that.failure,_that.userSession);case _:
  return null;

}
}

}

/// @nodoc


class _SignInState implements SignInState {
  const _SignInState({this.workspace = const TenantName.pure(), this.email = const EmailAddress.pure(), this.password = const Password.pure(), this.obscurePassword = true, this.submissionStatus = SignInSubmissionStatus.idle, this.failure = null, this.userSession = null});
  

@override@JsonKey() final  TenantName workspace;
@override@JsonKey() final  EmailAddress email;
@override@JsonKey() final  Password password;
@override@JsonKey() final  bool obscurePassword;
@override@JsonKey() final  SignInSubmissionStatus submissionStatus;
@override@JsonKey() final  AuthFailure? failure;
@override@JsonKey() final  UserSession? userSession;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInStateCopyWith<_SignInState> get copyWith => __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInState&&(identical(other.workspace, workspace) || other.workspace == workspace)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.userSession, userSession) || other.userSession == userSession));
}


@override
int get hashCode => Object.hash(runtimeType,workspace,email,password,obscurePassword,submissionStatus,failure,userSession);

@override
String toString() {
  return 'SignInState(workspace: $workspace, email: $email, password: $password, obscurePassword: $obscurePassword, submissionStatus: $submissionStatus, failure: $failure, userSession: $userSession)';
}


}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(_SignInState value, $Res Function(_SignInState) _then) = __$SignInStateCopyWithImpl;
@override @useResult
$Res call({
 TenantName workspace, EmailAddress email, Password password, bool obscurePassword, SignInSubmissionStatus submissionStatus, AuthFailure? failure, UserSession? userSession
});


@override $AuthFailureCopyWith<$Res>? get failure;@override $UserSessionCopyWith<$Res>? get userSession;

}
/// @nodoc
class __$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspace = null,Object? email = null,Object? password = null,Object? obscurePassword = null,Object? submissionStatus = null,Object? failure = freezed,Object? userSession = freezed,}) {
  return _then(_SignInState(
workspace: null == workspace ? _self.workspace : workspace // ignore: cast_nullable_to_non_nullable
as TenantName,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailAddress,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SignInSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,userSession: freezed == userSession ? _self.userSession : userSession // ignore: cast_nullable_to_non_nullable
as UserSession?,
  ));
}

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $AuthFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSessionCopyWith<$Res>? get userSession {
    if (_self.userSession == null) {
    return null;
  }

  return $UserSessionCopyWith<$Res>(_self.userSession!, (value) {
    return _then(_self.copyWith(userSession: value));
  });
}
}

// dart format on
