import 'package:auth_gorouter_riverpod/features/login/presentation/ui/widget/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const LoginForm(),
    );
  }
}
