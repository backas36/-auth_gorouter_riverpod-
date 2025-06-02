import 'package:auth_gorouter_riverpod/core/startup/start_up_screen.dart'
    show StartUpScreen;
import 'package:flutter/material.dart';
import 'package:auth_gorouter_riverpod/main_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: StartUpScreen(builder: (context) => const MainApp())),
  );
}
