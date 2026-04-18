import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';

@freezed
abstract class UserSession with _$UserSession {
  const factory UserSession({
    SessionUser? user,
    SessionTenant? tenant,
  }) = _UserSession;
}

@freezed
abstract class SessionUser with _$SessionUser {
  const factory SessionUser({
    required int id,
    required String name,
    required String surname,
    required String userName,
    required String emailAddress,
  }) = _SessionUser;
}

@freezed
abstract class SessionTenant with _$SessionTenant {
  const factory SessionTenant({
    required int id,
    required String tenancyName,
    required String name,
  }) = _SessionTenant;
}
