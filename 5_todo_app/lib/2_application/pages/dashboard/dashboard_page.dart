import 'package:flutter/material.dart';
import 'package:todo_app/2_application/core/page_config.dart';

class DasboardPage extends StatelessWidget {
  const DasboardPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.dashboard_rounded,
    name: 'dashboard',
    child: DasboardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}
