import 'package:auth_gorouter_riverpod/core/data/local/flutter_secure_storage_provider.dart';
import 'package:auth_gorouter_riverpod/core/data/local/isecure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 用剛剛拿到的 flutterSecureStorage 實例，建立一個你自己包裝過的 SecureStorage 物件（這個類別應該實作了 ISecureStorage 介面）。
final secureStorageProvider = Provider<ISecureStorage>((ref) {
  final flutterSecureStorage = ref.watch(flutterSecureStorageProvider);
  return SecureStorage(flutterSecureStorage);
});

final class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _secureStorage;

  SecureStorage(this._secureStorage);

  @override
  Future<String?> read(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }
}
