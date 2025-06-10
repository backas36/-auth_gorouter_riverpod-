import 'package:auth_gorouter_riverpod/core/data/remote/network_service_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: "https://auth-temp.onrender.com",
    connectTimeout: const Duration(seconds: 100),
    receiveTimeout: const Duration(seconds: 100),
    sendTimeout: const Duration(seconds: 100),
  );

  final dio = Dio(options);

  final networkServiceInterceptor = ref.watch(
    networkServiceInterceptorProvider(dio),
  );

  dio.interceptors.addAll([HttpFormatter(), networkServiceInterceptor]);

  return dio;
});
