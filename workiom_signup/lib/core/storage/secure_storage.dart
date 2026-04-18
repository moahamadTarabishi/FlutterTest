import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  const SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';

  Future<String?> readAuthToken() => _storage.read(key: _tokenKey);

  Future<void> writeAuthToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  Future<void> clearAuthToken() => _storage.delete(key: _tokenKey);

  Future<bool> hasAuthToken() async {
    final token = await _storage.read(key: _tokenKey);
    return token != null && token.isNotEmpty;
  }
}
