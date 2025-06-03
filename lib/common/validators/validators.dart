import 'package:auth_gorouter_riverpod/common/extension/string_hardcoded.dart';

Function(String?) validateEmail = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required'.hardcoded;
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Invalid email address'.hardcoded;
  }
  return null;
};

Function(String?) validatePassword = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required'.hardcoded;
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long'.hardcoded;
  }
  return null;
};
