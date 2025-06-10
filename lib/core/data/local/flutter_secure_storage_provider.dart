import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 在 app 任何地方用 ref.watch(flutterSecureStorageProvider) 取得一個安全儲存（加密儲存）物件
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  const androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  ); // 表示在 Android 上會用加密的 SharedPreferences 來儲存資料，提升安全性。

  const iosOptions = IOSOptions(
    accessibility: KeychainAccessibility
        .first_unlock, // 表示這些資料在 iOS 上只有在裝置第一次解鎖後才可存取（安全性較高）
  );

  return FlutterSecureStorage(aOptions: androidOptions, iOptions: iosOptions);
});
