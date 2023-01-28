import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/detail/todo_detail.dart';
import 'package:todo_app/2_application/pages/home/bloc/cubit/navigation_todo_cubit_cubit.dart';
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

class _HomePageState extends State<HomePage> with ChangeNotifier {
  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationTodoCubitCubit>(
      create: (context) => NavigationTodoCubitCubit(),
      child: BlocListener<NavigationTodoCubitCubit, NavigationTodoCubitState>(
        listenWhen: (previous, current) => previous.showGrid != current.showGrid,
        listener: (context, state) {
          if (context.canPop() && (state.showGrid ?? false)) {
            context.pop();
          }
        },
        child: AdaptiveScaffold(
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
          bodyRatio: 0.3,
          destinations: HomePage.tabs
              .map((page) => NavigationDestination(
                    icon: Icon(page.icon),
                    label: page.key,
                  ))
              .toList(),
          body: (_) => HomePage.tabs[widget.index].child,
          secondaryBody: widget.index != 1
              ? AdaptiveScaffold.emptyBuilder
              : (_) => BlocBuilder<NavigationTodoCubitCubit, NavigationTodoCubitState>(
                    builder: (context, state) {
                      // notify cubit to rebuild the screen without any errors
                      final isGrid = Breakpoints.mediumAndUp.isActive(context);
                      context.read<NavigationTodoCubitCubit>().breakpointChanged(isGrid);

                      final currentItem = state.selectedTodoItem;
                      if (currentItem != null) {
                        return TodoDetail(id: currentItem);
                      } else {
                        return const Placeholder();
                      }
                    },
                  ),
          smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
        ),
      ),
    );
  }

  void _tap(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].key}');
}
