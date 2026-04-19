// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent()';
}


}

/// @nodoc
class $SignUpEventCopyWith<$Res>  {
$SignUpEventCopyWith(SignUpEvent _, $Res Function(SignUpEvent) __);
}


/// Adds pattern-matching-related methods to [SignUpEvent].
extension SignUpEventPatterns on SignUpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignUpStarted value)?  started,TResult Function( SignUpEmailChanged value)?  emailChanged,TResult Function( SignUpPasswordChanged value)?  passwordChanged,TResult Function( SignUpTenantNameChanged value)?  tenantNameChanged,TResult Function( SignUpFirstNameChanged value)?  firstNameChanged,TResult Function( SignUpLastNameChanged value)?  lastNameChanged,TResult Function( SignUpEditionSelected value)?  editionSelected,TResult Function( SignUpSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignUpStarted() when started != null:
return started(_that);case SignUpEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignUpPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case SignUpTenantNameChanged() when tenantNameChanged != null:
return tenantNameChanged(_that);case SignUpFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case SignUpLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case SignUpEditionSelected() when editionSelected != null:
return editionSelected(_that);case SignUpSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignUpStarted value)  started,required TResult Function( SignUpEmailChanged value)  emailChanged,required TResult Function( SignUpPasswordChanged value)  passwordChanged,required TResult Function( SignUpTenantNameChanged value)  tenantNameChanged,required TResult Function( SignUpFirstNameChanged value)  firstNameChanged,required TResult Function( SignUpLastNameChanged value)  lastNameChanged,required TResult Function( SignUpEditionSelected value)  editionSelected,required TResult Function( SignUpSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case SignUpStarted():
return started(_that);case SignUpEmailChanged():
return emailChanged(_that);case SignUpPasswordChanged():
return passwordChanged(_that);case SignUpTenantNameChanged():
return tenantNameChanged(_that);case SignUpFirstNameChanged():
return firstNameChanged(_that);case SignUpLastNameChanged():
return lastNameChanged(_that);case SignUpEditionSelected():
return editionSelected(_that);case SignUpSubmitted():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignUpStarted value)?  started,TResult? Function( SignUpEmailChanged value)?  emailChanged,TResult? Function( SignUpPasswordChanged value)?  passwordChanged,TResult? Function( SignUpTenantNameChanged value)?  tenantNameChanged,TResult? Function( SignUpFirstNameChanged value)?  firstNameChanged,TResult? Function( SignUpLastNameChanged value)?  lastNameChanged,TResult? Function( SignUpEditionSelected value)?  editionSelected,TResult? Function( SignUpSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case SignUpStarted() when started != null:
return started(_that);case SignUpEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignUpPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case SignUpTenantNameChanged() when tenantNameChanged != null:
return tenantNameChanged(_that);case SignUpFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case SignUpLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case SignUpEditionSelected() when editionSelected != null:
return editionSelected(_that);case SignUpSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function( String tenantName)?  tenantNameChanged,TResult Function( String firstName)?  firstNameChanged,TResult Function( String lastName)?  lastNameChanged,TResult Function( int editionId)?  editionSelected,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignUpStarted() when started != null:
return started();case SignUpEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignUpPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case SignUpTenantNameChanged() when tenantNameChanged != null:
return tenantNameChanged(_that.tenantName);case SignUpFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.firstName);case SignUpLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.lastName);case SignUpEditionSelected() when editionSelected != null:
return editionSelected(_that.editionId);case SignUpSubmitted() when submitted != null:
return submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function( String tenantName)  tenantNameChanged,required TResult Function( String firstName)  firstNameChanged,required TResult Function( String lastName)  lastNameChanged,required TResult Function( int editionId)  editionSelected,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case SignUpStarted():
return started();case SignUpEmailChanged():
return emailChanged(_that.email);case SignUpPasswordChanged():
return passwordChanged(_that.password);case SignUpTenantNameChanged():
return tenantNameChanged(_that.tenantName);case SignUpFirstNameChanged():
return firstNameChanged(_that.firstName);case SignUpLastNameChanged():
return lastNameChanged(_that.lastName);case SignUpEditionSelected():
return editionSelected(_that.editionId);case SignUpSubmitted():
return submitted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function( String tenantName)?  tenantNameChanged,TResult? Function( String firstName)?  firstNameChanged,TResult? Function( String lastName)?  lastNameChanged,TResult? Function( int editionId)?  editionSelected,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case SignUpStarted() when started != null:
return started();case SignUpEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignUpPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case SignUpTenantNameChanged() when tenantNameChanged != null:
return tenantNameChanged(_that.tenantName);case SignUpFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.firstName);case SignUpLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.lastName);case SignUpEditionSelected() when editionSelected != null:
return editionSelected(_that.editionId);case SignUpSubmitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class SignUpStarted implements SignUpEvent {
  const SignUpStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.started()';
}


}




/// @nodoc


class SignUpEmailChanged implements SignUpEvent {
  const SignUpEmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpEmailChangedCopyWith<SignUpEmailChanged> get copyWith => _$SignUpEmailChangedCopyWithImpl<SignUpEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignUpEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignUpEmailChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpEmailChangedCopyWith(SignUpEmailChanged value, $Res Function(SignUpEmailChanged) _then) = _$SignUpEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignUpEmailChangedCopyWithImpl<$Res>
    implements $SignUpEmailChangedCopyWith<$Res> {
  _$SignUpEmailChangedCopyWithImpl(this._self, this._then);

  final SignUpEmailChanged _self;
  final $Res Function(SignUpEmailChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignUpEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpPasswordChanged implements SignUpEvent {
  const SignUpPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpPasswordChangedCopyWith<SignUpPasswordChanged> get copyWith => _$SignUpPasswordChangedCopyWithImpl<SignUpPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SignUpEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $SignUpPasswordChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpPasswordChangedCopyWith(SignUpPasswordChanged value, $Res Function(SignUpPasswordChanged) _then) = _$SignUpPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$SignUpPasswordChangedCopyWithImpl<$Res>
    implements $SignUpPasswordChangedCopyWith<$Res> {
  _$SignUpPasswordChangedCopyWithImpl(this._self, this._then);

  final SignUpPasswordChanged _self;
  final $Res Function(SignUpPasswordChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(SignUpPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpTenantNameChanged implements SignUpEvent {
  const SignUpTenantNameChanged(this.tenantName);
  

 final  String tenantName;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpTenantNameChangedCopyWith<SignUpTenantNameChanged> get copyWith => _$SignUpTenantNameChangedCopyWithImpl<SignUpTenantNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpTenantNameChanged&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName));
}


@override
int get hashCode => Object.hash(runtimeType,tenantName);

@override
String toString() {
  return 'SignUpEvent.tenantNameChanged(tenantName: $tenantName)';
}


}

/// @nodoc
abstract mixin class $SignUpTenantNameChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpTenantNameChangedCopyWith(SignUpTenantNameChanged value, $Res Function(SignUpTenantNameChanged) _then) = _$SignUpTenantNameChangedCopyWithImpl;
@useResult
$Res call({
 String tenantName
});




}
/// @nodoc
class _$SignUpTenantNameChangedCopyWithImpl<$Res>
    implements $SignUpTenantNameChangedCopyWith<$Res> {
  _$SignUpTenantNameChangedCopyWithImpl(this._self, this._then);

  final SignUpTenantNameChanged _self;
  final $Res Function(SignUpTenantNameChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tenantName = null,}) {
  return _then(SignUpTenantNameChanged(
null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpFirstNameChanged implements SignUpEvent {
  const SignUpFirstNameChanged(this.firstName);
  

 final  String firstName;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpFirstNameChangedCopyWith<SignUpFirstNameChanged> get copyWith => _$SignUpFirstNameChangedCopyWithImpl<SignUpFirstNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpFirstNameChanged&&(identical(other.firstName, firstName) || other.firstName == firstName));
}


@override
int get hashCode => Object.hash(runtimeType,firstName);

@override
String toString() {
  return 'SignUpEvent.firstNameChanged(firstName: $firstName)';
}


}

/// @nodoc
abstract mixin class $SignUpFirstNameChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpFirstNameChangedCopyWith(SignUpFirstNameChanged value, $Res Function(SignUpFirstNameChanged) _then) = _$SignUpFirstNameChangedCopyWithImpl;
@useResult
$Res call({
 String firstName
});




}
/// @nodoc
class _$SignUpFirstNameChangedCopyWithImpl<$Res>
    implements $SignUpFirstNameChangedCopyWith<$Res> {
  _$SignUpFirstNameChangedCopyWithImpl(this._self, this._then);

  final SignUpFirstNameChanged _self;
  final $Res Function(SignUpFirstNameChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,}) {
  return _then(SignUpFirstNameChanged(
null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpLastNameChanged implements SignUpEvent {
  const SignUpLastNameChanged(this.lastName);
  

 final  String lastName;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpLastNameChangedCopyWith<SignUpLastNameChanged> get copyWith => _$SignUpLastNameChangedCopyWithImpl<SignUpLastNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpLastNameChanged&&(identical(other.lastName, lastName) || other.lastName == lastName));
}


@override
int get hashCode => Object.hash(runtimeType,lastName);

@override
String toString() {
  return 'SignUpEvent.lastNameChanged(lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $SignUpLastNameChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpLastNameChangedCopyWith(SignUpLastNameChanged value, $Res Function(SignUpLastNameChanged) _then) = _$SignUpLastNameChangedCopyWithImpl;
@useResult
$Res call({
 String lastName
});




}
/// @nodoc
class _$SignUpLastNameChangedCopyWithImpl<$Res>
    implements $SignUpLastNameChangedCopyWith<$Res> {
  _$SignUpLastNameChangedCopyWithImpl(this._self, this._then);

  final SignUpLastNameChanged _self;
  final $Res Function(SignUpLastNameChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastName = null,}) {
  return _then(SignUpLastNameChanged(
null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpEditionSelected implements SignUpEvent {
  const SignUpEditionSelected(this.editionId);
  

 final  int editionId;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpEditionSelectedCopyWith<SignUpEditionSelected> get copyWith => _$SignUpEditionSelectedCopyWithImpl<SignUpEditionSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEditionSelected&&(identical(other.editionId, editionId) || other.editionId == editionId));
}


@override
int get hashCode => Object.hash(runtimeType,editionId);

@override
String toString() {
  return 'SignUpEvent.editionSelected(editionId: $editionId)';
}


}

/// @nodoc
abstract mixin class $SignUpEditionSelectedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $SignUpEditionSelectedCopyWith(SignUpEditionSelected value, $Res Function(SignUpEditionSelected) _then) = _$SignUpEditionSelectedCopyWithImpl;
@useResult
$Res call({
 int editionId
});




}
/// @nodoc
class _$SignUpEditionSelectedCopyWithImpl<$Res>
    implements $SignUpEditionSelectedCopyWith<$Res> {
  _$SignUpEditionSelectedCopyWithImpl(this._self, this._then);

  final SignUpEditionSelected _self;
  final $Res Function(SignUpEditionSelected) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? editionId = null,}) {
  return _then(SignUpEditionSelected(
null == editionId ? _self.editionId : editionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SignUpSubmitted implements SignUpEvent {
  const SignUpSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.submitted()';
}


}




/// @nodoc
mixin _$SignUpState {

 List<Edition> get editions; PasswordPolicy? get passwordPolicy; int? get selectedEditionId; EmailAddress get email; Password get password; TenantName get tenantName; PersonName get firstName; PersonName get lastName; TenantAvailability get tenantAvailability; SubmissionStatus get submissionStatus; AuthFailure? get failure;// Set when GetEditions or GetPasswordPolicy fails on startup.
 bool get bootFailed;// Populated after RegisterAndAuthenticate succeeds.
 UserSession? get userSession;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&const DeepCollectionEquality().equals(other.editions, editions)&&(identical(other.passwordPolicy, passwordPolicy) || other.passwordPolicy == passwordPolicy)&&(identical(other.selectedEditionId, selectedEditionId) || other.selectedEditionId == selectedEditionId)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.tenantAvailability, tenantAvailability) || other.tenantAvailability == tenantAvailability)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.bootFailed, bootFailed) || other.bootFailed == bootFailed)&&(identical(other.userSession, userSession) || other.userSession == userSession));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(editions),passwordPolicy,selectedEditionId,email,password,tenantName,firstName,lastName,tenantAvailability,submissionStatus,failure,bootFailed,userSession);

@override
String toString() {
  return 'SignUpState(editions: $editions, passwordPolicy: $passwordPolicy, selectedEditionId: $selectedEditionId, email: $email, password: $password, tenantName: $tenantName, firstName: $firstName, lastName: $lastName, tenantAvailability: $tenantAvailability, submissionStatus: $submissionStatus, failure: $failure, bootFailed: $bootFailed, userSession: $userSession)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 List<Edition> editions, PasswordPolicy? passwordPolicy, int? selectedEditionId, EmailAddress email, Password password, TenantName tenantName, PersonName firstName, PersonName lastName, TenantAvailability tenantAvailability, SubmissionStatus submissionStatus, AuthFailure? failure, bool bootFailed, UserSession? userSession
});


$PasswordPolicyCopyWith<$Res>? get passwordPolicy;$AuthFailureCopyWith<$Res>? get failure;$UserSessionCopyWith<$Res>? get userSession;

}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? editions = null,Object? passwordPolicy = freezed,Object? selectedEditionId = freezed,Object? email = null,Object? password = null,Object? tenantName = null,Object? firstName = null,Object? lastName = null,Object? tenantAvailability = null,Object? submissionStatus = null,Object? failure = freezed,Object? bootFailed = null,Object? userSession = freezed,}) {
  return _then(_self.copyWith(
editions: null == editions ? _self.editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,passwordPolicy: freezed == passwordPolicy ? _self.passwordPolicy : passwordPolicy // ignore: cast_nullable_to_non_nullable
as PasswordPolicy?,selectedEditionId: freezed == selectedEditionId ? _self.selectedEditionId : selectedEditionId // ignore: cast_nullable_to_non_nullable
as int?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailAddress,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as TenantName,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as PersonName,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as PersonName,tenantAvailability: null == tenantAvailability ? _self.tenantAvailability : tenantAvailability // ignore: cast_nullable_to_non_nullable
as TenantAvailability,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,bootFailed: null == bootFailed ? _self.bootFailed : bootFailed // ignore: cast_nullable_to_non_nullable
as bool,userSession: freezed == userSession ? _self.userSession : userSession // ignore: cast_nullable_to_non_nullable
as UserSession?,
  ));
}
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordPolicyCopyWith<$Res>? get passwordPolicy {
    if (_self.passwordPolicy == null) {
    return null;
  }

  return $PasswordPolicyCopyWith<$Res>(_self.passwordPolicy!, (value) {
    return _then(_self.copyWith(passwordPolicy: value));
  });
}/// Create a copy of SignUpState
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
}/// Create a copy of SignUpState
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


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Edition> editions,  PasswordPolicy? passwordPolicy,  int? selectedEditionId,  EmailAddress email,  Password password,  TenantName tenantName,  PersonName firstName,  PersonName lastName,  TenantAvailability tenantAvailability,  SubmissionStatus submissionStatus,  AuthFailure? failure,  bool bootFailed,  UserSession? userSession)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.editions,_that.passwordPolicy,_that.selectedEditionId,_that.email,_that.password,_that.tenantName,_that.firstName,_that.lastName,_that.tenantAvailability,_that.submissionStatus,_that.failure,_that.bootFailed,_that.userSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Edition> editions,  PasswordPolicy? passwordPolicy,  int? selectedEditionId,  EmailAddress email,  Password password,  TenantName tenantName,  PersonName firstName,  PersonName lastName,  TenantAvailability tenantAvailability,  SubmissionStatus submissionStatus,  AuthFailure? failure,  bool bootFailed,  UserSession? userSession)  $default,) {final _that = this;
switch (_that) {
case _SignUpState():
return $default(_that.editions,_that.passwordPolicy,_that.selectedEditionId,_that.email,_that.password,_that.tenantName,_that.firstName,_that.lastName,_that.tenantAvailability,_that.submissionStatus,_that.failure,_that.bootFailed,_that.userSession);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Edition> editions,  PasswordPolicy? passwordPolicy,  int? selectedEditionId,  EmailAddress email,  Password password,  TenantName tenantName,  PersonName firstName,  PersonName lastName,  TenantAvailability tenantAvailability,  SubmissionStatus submissionStatus,  AuthFailure? failure,  bool bootFailed,  UserSession? userSession)?  $default,) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.editions,_that.passwordPolicy,_that.selectedEditionId,_that.email,_that.password,_that.tenantName,_that.firstName,_that.lastName,_that.tenantAvailability,_that.submissionStatus,_that.failure,_that.bootFailed,_that.userSession);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpState implements SignUpState {
  const _SignUpState({final  List<Edition> editions = const [], this.passwordPolicy = null, this.selectedEditionId = null, this.email = const EmailAddress.pure(), this.password = const Password.pure(), this.tenantName = const TenantName.pure(), this.firstName = const PersonName.pure(), this.lastName = const PersonName.pure(), this.tenantAvailability = TenantAvailability.unknown, this.submissionStatus = SubmissionStatus.idle, this.failure = null, this.bootFailed = false, this.userSession = null}): _editions = editions;
  

 final  List<Edition> _editions;
@override@JsonKey() List<Edition> get editions {
  if (_editions is EqualUnmodifiableListView) return _editions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editions);
}

@override@JsonKey() final  PasswordPolicy? passwordPolicy;
@override@JsonKey() final  int? selectedEditionId;
@override@JsonKey() final  EmailAddress email;
@override@JsonKey() final  Password password;
@override@JsonKey() final  TenantName tenantName;
@override@JsonKey() final  PersonName firstName;
@override@JsonKey() final  PersonName lastName;
@override@JsonKey() final  TenantAvailability tenantAvailability;
@override@JsonKey() final  SubmissionStatus submissionStatus;
@override@JsonKey() final  AuthFailure? failure;
// Set when GetEditions or GetPasswordPolicy fails on startup.
@override@JsonKey() final  bool bootFailed;
// Populated after RegisterAndAuthenticate succeeds.
@override@JsonKey() final  UserSession? userSession;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&const DeepCollectionEquality().equals(other._editions, _editions)&&(identical(other.passwordPolicy, passwordPolicy) || other.passwordPolicy == passwordPolicy)&&(identical(other.selectedEditionId, selectedEditionId) || other.selectedEditionId == selectedEditionId)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.tenantAvailability, tenantAvailability) || other.tenantAvailability == tenantAvailability)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.bootFailed, bootFailed) || other.bootFailed == bootFailed)&&(identical(other.userSession, userSession) || other.userSession == userSession));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_editions),passwordPolicy,selectedEditionId,email,password,tenantName,firstName,lastName,tenantAvailability,submissionStatus,failure,bootFailed,userSession);

@override
String toString() {
  return 'SignUpState(editions: $editions, passwordPolicy: $passwordPolicy, selectedEditionId: $selectedEditionId, email: $email, password: $password, tenantName: $tenantName, firstName: $firstName, lastName: $lastName, tenantAvailability: $tenantAvailability, submissionStatus: $submissionStatus, failure: $failure, bootFailed: $bootFailed, userSession: $userSession)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 List<Edition> editions, PasswordPolicy? passwordPolicy, int? selectedEditionId, EmailAddress email, Password password, TenantName tenantName, PersonName firstName, PersonName lastName, TenantAvailability tenantAvailability, SubmissionStatus submissionStatus, AuthFailure? failure, bool bootFailed, UserSession? userSession
});


@override $PasswordPolicyCopyWith<$Res>? get passwordPolicy;@override $AuthFailureCopyWith<$Res>? get failure;@override $UserSessionCopyWith<$Res>? get userSession;

}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? editions = null,Object? passwordPolicy = freezed,Object? selectedEditionId = freezed,Object? email = null,Object? password = null,Object? tenantName = null,Object? firstName = null,Object? lastName = null,Object? tenantAvailability = null,Object? submissionStatus = null,Object? failure = freezed,Object? bootFailed = null,Object? userSession = freezed,}) {
  return _then(_SignUpState(
editions: null == editions ? _self._editions : editions // ignore: cast_nullable_to_non_nullable
as List<Edition>,passwordPolicy: freezed == passwordPolicy ? _self.passwordPolicy : passwordPolicy // ignore: cast_nullable_to_non_nullable
as PasswordPolicy?,selectedEditionId: freezed == selectedEditionId ? _self.selectedEditionId : selectedEditionId // ignore: cast_nullable_to_non_nullable
as int?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailAddress,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as TenantName,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as PersonName,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as PersonName,tenantAvailability: null == tenantAvailability ? _self.tenantAvailability : tenantAvailability // ignore: cast_nullable_to_non_nullable
as TenantAvailability,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,bootFailed: null == bootFailed ? _self.bootFailed : bootFailed // ignore: cast_nullable_to_non_nullable
as bool,userSession: freezed == userSession ? _self.userSession : userSession // ignore: cast_nullable_to_non_nullable
as UserSession?,
  ));
}

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordPolicyCopyWith<$Res>? get passwordPolicy {
    if (_self.passwordPolicy == null) {
    return null;
  }

  return $PasswordPolicyCopyWith<$Res>(_self.passwordPolicy!, (value) {
    return _then(_self.copyWith(passwordPolicy: value));
  });
}/// Create a copy of SignUpState
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
}/// Create a copy of SignUpState
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
