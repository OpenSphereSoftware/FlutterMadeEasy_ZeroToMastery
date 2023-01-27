import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';

class SettingsPage extends StatelessWidget {
  static const PageRouteConfig page = PageRouteConfig(
    key: 'settings',
    icon: Icons.settings_rounded,
    child: Text('settings'),
  );

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              // TODO(Max): change to PageRouteConfig
              context.go('/home/dashboard');
            }
          },
        ),
      ),
      body: const Placeholder(),
    );
  }
}
