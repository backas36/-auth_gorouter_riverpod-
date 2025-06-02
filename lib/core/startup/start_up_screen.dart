import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUpScreen extends ConsumerWidget {
  final WidgetBuilder builder;
  const StartUpScreen({super.key, required this.builder});

  // TODO: setup start up module
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return builder(context);
  }
}
