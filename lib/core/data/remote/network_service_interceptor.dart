import 'package:auth_gorouter_riverpod/common/http_status/status_code.dart';
import 'package:auth_gorouter_riverpod/core/data/remote/endpoints.dart';
import 'package:auth_gorouter_riverpod/core/data/remote/token/itoken_service.dart';
import 'package:auth_gorouter_riverpod/core/data/remote/token/token_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
      final tokenService = ref.watch(tokenServiceProvider(dio));
      return NetworkServiceInterceptor(tokenService, dio);
    });

final class NetworkServiceInterceptor extends Interceptor {
  final ITokenService _tokenService;
  final Dio _dio;

  NetworkServiceInterceptor(this._tokenService, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenService.getAccessToken();

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == unauthorized &&
        err.requestOptions.path != loginEndPoint) {
      final token = await _tokenService.getRefreshToken();

      try {
        final result = await _tokenService.refreshToken(token);

        final accessToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        await _tokenService.saveTokens(accessToken, refreshToken);

        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $accessToken';

        return handler.resolve(await _dio.fetch(options));
      } on DioException catch (e) {
        // 如果 refresh token 過期，就清除 token 並重新登入
        if (e.response?.statusCode == refreshTokenExpired) {
          await _tokenService.clearTokens();
          return handler.next(e);
        }
        // 如果是其他錯誤，就繼續往下傳
        return handler.next(e);
      }
    }
    // 如果是其他錯誤，就繼續往下傳
    return handler.next(err);
  }
}
