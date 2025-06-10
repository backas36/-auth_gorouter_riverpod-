import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state_provider.freezed.dart';

final authStateProvider = NotifierProvider<AuthState, UserState?>(
  () => AuthState(),
);

class AuthState extends Notifier<UserState?> {
  @override
  UserState? build() {
    return null;
  }

  void setAuthState(UserState value) {
    state = value;
  }

  void clearAuthState() {
    state = null;
  }
}

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    required bool isLoggedIn,
    required String? email,
    required String? name,
  }) = _UserState;
}
