import 'package:auth_gorouter_riverpod/common/extension/string_hardcoded.dart';
import 'package:auth_gorouter_riverpod/common/style/app_dimensions.dart';
import 'package:auth_gorouter_riverpod/common/validators/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                validator: validateEmail,
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
                validator: validatePassword,
              ),
              //const ForgotPassword(),
              const SizedBox(height: kLarge),

              //TODO: LoginButton(onPressed: _login),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: kMedium),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kSmall),
                    ),
                  ),
                  onPressed: _onLoginPressed,
                  label: Text(
                    'login'.hardcoded,
                    style: const TextStyle(fontSize: kMedium),
                  ),
                ),
              ),

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

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onLoginPressed() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      debugPrint('email: ${_emailController.text}');
      debugPrint('password: ${_passwordController.text}');
    }
  }
}
