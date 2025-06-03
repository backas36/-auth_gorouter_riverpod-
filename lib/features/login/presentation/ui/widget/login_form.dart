import 'package:auth_gorouter_riverpod/common/extension/string_hardcoded.dart';
import 'package:auth_gorouter_riverpod/common/style/app_dimensions.dart';
import 'package:auth_gorouter_riverpod/common/validators/validators.dart';
import 'package:auth_gorouter_riverpod/core/route/route_name.dart';
import 'package:auth_gorouter_riverpod/features/login/presentation/controller/login_controller.dart';
import 'package:auth_gorouter_riverpod/features/login/presentation/ui/widget/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kMedium),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email'.hardcoded,
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) => validateEmail(value),
              ),
              const SizedBox(height: kMedium),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password'.hardcoded,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: _toggleObscureText,
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) => validatePassword(value),
              ),
              //const ForgotPassword(),
              const SizedBox(height: kLarge),

              LoginButton(onPressed: _onLoginPressed),

              const SizedBox(height: kLarge),
              //const LoginWith(),
              const SizedBox(height: kLarge),
              //const DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  void _listener() {
    debugPrint(' ==========listener==========');
    //TODO: handle error

    ref.listen(
      loginControllerProvider.select((value) => value.isLoginSuccess),
      (_, next) {
        if (next) {
          //context.goNamed(homeRoute);
        }
      },
    );
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onLoginPressed() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final formData = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };
      ref.read(loginControllerProvider.notifier).setFormData(formData);
      ref.read(loginControllerProvider.notifier).login();
    }
  }
}
