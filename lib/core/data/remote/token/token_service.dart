import 'package:auth_gorouter_riverpod/common/dtos/token_data.dart';
import 'package:auth_gorouter_riverpod/common/http_status/status_code.dart';
import 'package:auth_gorouter_riverpod/core/data/local/isecure_storage.dart';
import 'package:auth_gorouter_riverpod/core/data/local/secure_storage.dart';
import 'package:auth_gorouter_riverpod/core/data/local/secure_storage_const.dart';
import 'package:auth_gorouter_riverpod/core/data/remote/token/itoken_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// family Provider 允許你在取得 Provider 時傳入一個參數（這裡是 Dio）。

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenService(dio, secureStorage);
});

class TokenService implements ITokenService {
  final Dio _dio;
  final ISecureStorage _secureStorage;

  TokenService(this._dio, this._secureStorage);

  @override
  Future<String?> getAccessToken() => _secureStorage.read(accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(refreshTokenKey);

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) {
    //await _secureStorage.write(accessTokenKey, accessToken);
    //await _secureStorage.write(refreshTokenKey, refreshToken);
    return Future.wait([
      _secureStorage.write(accessTokenKey, accessToken),
      _secureStorage.write(refreshTokenKey, refreshToken),
    ]);
  }

  @override
  Future<void> clearTokens() {
    return Future.wait([
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
    ]);
  }

  @override
  Future<TokenDataResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/refresh-token',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == success) {
      return TokenDataResponse.fromJson(
        response.data ?? {},
        (json) => TokenData.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
      // 把這次請求的設定（如網址、headers 等）傳進去，方便錯誤追蹤。
      // 把這次的 response 物件也傳進去，讓外部可以看到伺服器回了什麼內容。
      // 如果 refresh token 請求失敗，就把這次請求的詳細資訊包成一個 DioException 丟出去，讓外層可以根據這個錯誤做適當處理（例如顯示錯誤訊息、重新登入等）。
    }
  }
}
