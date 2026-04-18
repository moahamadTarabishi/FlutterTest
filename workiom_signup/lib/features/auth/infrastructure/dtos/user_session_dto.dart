import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';

part 'user_session_dto.freezed.dart';
part 'user_session_dto.g.dart';

@freezed
abstract class UserSessionResultDto with _$UserSessionResultDto {
  const factory UserSessionResultDto({
    SessionUserDto? user,
    SessionTenantDto? tenant,
  }) = _UserSessionResultDto;

  factory UserSessionResultDto.fromJson(Map<String, dynamic> json) =>
      _$UserSessionResultDtoFromJson(json);
}

@freezed
abstract class SessionUserDto with _$SessionUserDto {
  const factory SessionUserDto({
    required int id,
    required String name,
    required String surname,
    required String userName,
    required String emailAddress,
  }) = _SessionUserDto;

  factory SessionUserDto.fromJson(Map<String, dynamic> json) =>
      _$SessionUserDtoFromJson(json);
}

@freezed
abstract class SessionTenantDto with _$SessionTenantDto {
  const factory SessionTenantDto({
    required int id,
    required String tenancyName,
    required String name,
  }) = _SessionTenantDto;

  factory SessionTenantDto.fromJson(Map<String, dynamic> json) =>
      _$SessionTenantDtoFromJson(json);
}

extension UserSessionResultDtoMapper on UserSessionResultDto {
  UserSession? toDomain() {
    final u = user;
    final t = tenant;
    if (u == null) return null;
    return UserSession(
      user: SessionUser(
        id: u.id,
        name: u.name,
        surname: u.surname,
        userName: u.userName,
        emailAddress: u.emailAddress,
      ),
      tenant: t == null
          ? null
          : SessionTenant(
              id: t.id,
              tenancyName: t.tenancyName,
              name: t.name,
            ),
    );
  }
}
