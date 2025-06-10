// service 是負責與外部溝通，
import 'package:auth_gorouter_riverpod/common/dtos/refresh_token_response.dart';

abstract interface class ITokenService {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveTokens(String accessToken, String refreshToken);

  Future<void> clearTokens();

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
