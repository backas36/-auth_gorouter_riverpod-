import 'package:auth_gorouter_riverpod/common/extension/string_hardcoded.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO: button push to setting,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home".hardcoded)),
      body: Center(child: Text('Home')),
    );
  }
}
