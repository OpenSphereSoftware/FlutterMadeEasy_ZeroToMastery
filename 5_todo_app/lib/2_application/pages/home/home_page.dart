import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/detail/todo_detail.dart';
import 'package:todo_app/2_application/pages/home/bloc/navigation_todo_cubit_cubit.dart';
import 'package:todo_app/2_application/pages/overview/todo_overview.dart';
import 'package:todo_app/2_application/pages/overview/widgets/add_todo_button.dart';

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
    final List<NavigationDestination> destinations = HomePage.tabs
        .map((page) => NavigationDestination(
              icon: Icon(page.icon),
              label: page.key,
            ))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: BlocProvider<NavigationTodoCubitCubit>(
          create: (context) => NavigationTodoCubitCubit(),
          child: BlocListener<NavigationTodoCubitCubit, NavigationTodoCubitState>(
            listenWhen: (previous, current) => previous.showGrid != current.showGrid,
            listener: (context, state) {
              if (context.canPop() && (state.showGrid ?? false)) {
                context.pop();
              }
            },
            child: AdaptiveLayout(
              bodyRatio: 0.3,
              primaryNavigation: SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  Breakpoints.medium: SlotLayout.from(
                    inAnimation: AdaptiveScaffold.leftOutIn,
                    key: const Key('primary-navigation-medium'),
                    builder: (_) => AdaptiveScaffold.standardNavigationRail(
                      leading: const AddTodoButtonSmall(
                        key: Key('add-todo-button'),
                      ),
                      selectedIndex: widget.index,
                      extended: false,
                      onDestinationSelected: (index) => _tap(context, index),
                      destinations: destinations.map((_) => AdaptiveScaffold.toRailDestination(_)).toList(),
                    ),
                  ),
                  Breakpoints.large: SlotLayout.from(
                    inAnimation: AdaptiveScaffold.leftOutIn,
                    key: const Key('primary-navigation-large'),
                    builder: (_) => AdaptiveScaffold.standardNavigationRail(
                      leading: const AddTodoButtonLarge(
                        key: Key('add-todo-button'),
                      ),
                      selectedIndex: widget.index,
                      extended: true,
                      onDestinationSelected: (index) => _tap(context, index),
                      destinations: destinations.map((_) => AdaptiveScaffold.toRailDestination(_)).toList(),
                    ),
                  ),
                },
              ),
              // Body switches between a ListView and a GridView from small to medium
              // breakpoints and onwards.
              body: SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  Breakpoints.smallAndUp: SlotLayout.from(
                    key: const Key('primary-body-small'),
                    builder: (_) => HomePage.tabs[widget.index].child,
                  )
                },
              ),
              secondaryBody: SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  Breakpoints.mediumAndUp: SlotLayout.from(
                    key: const Key('secondary-body-medium'),
                    builder: widget.index != 1
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
                  )
                },
              ),
              // BottomNavigation is only active in small views defined as under 600 dp
              // width.
              bottomNavigation: SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  Breakpoints.small: SlotLayout.from(
                    key: const Key('bottom-navigation-small'),
                    inAnimation: AdaptiveScaffold.bottomToTop,
                    outAnimation: AdaptiveScaffold.topToBottom,
                    builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                      currentIndex: widget.index,
                      onDestinationSelected: (index) => _tap(context, index),
                      destinations: destinations,
                    ),
                  )
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tap(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].key}');
}
