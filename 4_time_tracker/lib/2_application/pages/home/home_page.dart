import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/2_application/core/page_route_config.dart';
import 'package:time_tracker/2_application/pages/settings/settings_page.dart';

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
      key: 'project',
      icon: Icons.work_history_rounded,
      child: Text('project'),
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      keepPage: true,
      initialPage: widget.index,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _pageController.animateToPage(
        widget.index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(SettingsPage.page.icon),
            tooltip: SettingsPage.page.key,
            onPressed: () => context.go('/home/${SettingsPage.page.key}'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.index,
        onDestinationSelected: (index) => _tap(context, index),
        destinations: HomePage.tabs
            .map((page) => NavigationDestination(
                  icon: Icon(page.icon),
                  label: page.key,
                ))
            .toList(),
      ),
      body: SafeArea(
        top: false,
        child: PageView(
          controller: _pageController,
          children: HomePage.tabs.map((page) => page.child).toList(),
        ),
      ),
    );
  }

  void _tap(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].key}');
}
