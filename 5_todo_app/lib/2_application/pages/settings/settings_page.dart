import 'package:flutter/material.dart';
import 'package:todo_app/2_application/core/page_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_rounded,
    name: 'settings',
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          onPressed: () => throw Exception('Test exception'),
          child: const Text('Crash'),
        ),
      ),
    );
  }
}
