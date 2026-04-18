abstract final class ApiConstants {
  static const baseUrl = 'https://api.workiom.club';
  static const ianaTimezone = 'Europe/Istanbul';

  // Endpoints
  static const getCurrentLoginInformations =
      '/api/services/app/Session/GetCurrentLoginInformations';
  static const getEditionsForSelect =
      '/api/services/app/TenantRegistration/GetEditionsForSelect';
  static const getPasswordComplexitySetting =
      '/api/services/app/Profile/GetPasswordComplexitySetting';
  static const isTenantAvailable =
      '/api/services/app/Account/IsTenantAvailable';
  static const registerTenant =
      '/api/services/app/TenantRegistration/RegisterTenant';
  static const authenticate = '/api/TokenAuth/Authenticate';

  // Timeouts
  static const connectionTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
}
