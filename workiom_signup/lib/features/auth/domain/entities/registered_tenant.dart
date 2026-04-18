import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_tenant.freezed.dart';

@freezed
abstract class RegisteredTenant with _$RegisteredTenant {
  const factory RegisteredTenant({
    int? tenantId,
    @Default(false) bool isPending,
  }) = _RegisteredTenant;
}
