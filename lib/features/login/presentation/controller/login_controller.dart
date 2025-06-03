import 'package:auth_gorouter_riverpod/features/login/data/dto/request/login_request.dart';
import 'package:auth_gorouter_riverpod/features/login/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider =
    AutoDisposeNotifierProvider<LoginController, LoginState>(
      () => LoginController(),
    );

class LoginController extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> login() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final loginRequest = LoginRequest(
        email: state.loginForm['email'],
        password: state.loginForm['password'],
      );
      // TODO: call api
      // TODO: handl auth

      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false, isLoginSuccess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(loginForm: formData);
  }
}
