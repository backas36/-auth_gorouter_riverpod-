import 'package:auth_gorouter_riverpod/core/data/local/isecure_storage.dart';
import 'package:auth_gorouter_riverpod/core/data/local/secure_storage.dart';
import 'package:auth_gorouter_riverpod/core/data/local/secure_storage_const.dart';
import 'package:auth_gorouter_riverpod/features/login/source/local/itoken_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenStorageProvider = Provider<ITokenStorage>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenStorage(secureStorage);
});

final class TokenStorage implements ITokenStorage {
  final ISecureStorage _secureStorage;

  TokenStorage(this._secureStorage);

  @override
  Future<void> storeToken(String token) async {
    await _secureStorage.write(accessTokenKey, token);
    await _secureStorage.write(refreshTokenKey, token);
  }
}
