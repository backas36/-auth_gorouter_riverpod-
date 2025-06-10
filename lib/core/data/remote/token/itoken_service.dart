import 'package:auth_gorouter_riverpod/common/dtos/token_data.dart';

// service 是負責與外部溝通
abstract interface class ITokenService {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveTokens(String accessToken, String refreshToken);

  Future<void> clearTokens();

  Future<TokenDataResponse> refreshToken(String? refreshToken);
}
