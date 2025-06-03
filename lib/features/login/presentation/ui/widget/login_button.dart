import 'package:auth_gorouter_riverpod/common/extension/string_hardcoded.dart';
import 'package:auth_gorouter_riverpod/common/style/app_dimensions.dart';
import 'package:auth_gorouter_riverpod/features/login/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      loginControllerProvider.select((value) => value.isLoading),
    );
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: kMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSmall),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        label: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                'login'.hardcoded,
                style: const TextStyle(fontSize: kMedium),
              ),
      ),
    );
  }
}
