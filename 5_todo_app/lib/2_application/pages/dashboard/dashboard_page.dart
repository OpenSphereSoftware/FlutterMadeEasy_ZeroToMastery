import 'package:flutter/material.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const pageConfig = PageRouteConfig(
    key: 'dashboard',
    icon: Icons.dashboard_rounded,
    child: DashboardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dashboard'),
    );
  }
}
