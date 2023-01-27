import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/overview/todo_overview.dart';
import 'package:todo_app/2_application/pages/settings/settings_page.dart';

typedef TodoSelectedCallback = void Function(UniqueID?);

class HomePage extends StatefulWidget {
  HomePage({
    required String tab,
    super.key,
  }) : index = tabs.indexWhere((element) => element.key == tab);

  final int index;

  // move config to page if it exist
  static const tabs = [
    PageRouteConfig(
      key: 'dashboard',
      icon: Icons.dashboard_rounded,
      child: Text('dashboard'),
    ),
    PageRouteConfig(
      key: 'overview',
      icon: Icons.work_history_rounded,
      child: TodoOverview(),
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UniqueID? currentElement;

  void selectTodo(UniqueID? selectedElement) {
    setState(() {
      currentElement = selectedElement;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {}
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      useDrawer: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(SettingsPage.page.icon),
            tooltip: SettingsPage.page.key,
            onPressed: () => context.go('/home/${SettingsPage.page.key}'),
          ),
        ],
      ),
      selectedIndex: widget.index,
      onSelectedIndexChange: (index) => _tap(context, index),
      destinations: HomePage.tabs
          .map((page) => NavigationDestination(
                icon: Icon(page.icon),
                label: page.key,
              ))
          .toList(),
      bodyRatio: 0.2,
      body: (_) => HomePage.tabs[widget.index].child,
      secondaryBody: (_) => Container(color: const Color.fromARGB(255, 234, 158, 192)),
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }

  void _tap(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].key}');
}
