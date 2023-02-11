import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/pages/create_todo_collection/create_todo_collection.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/create_todo_entry.dart';
import 'package:todo_app/2_application/pages/detail/todo_detail.dart';
import 'package:todo_app/2_application/pages/home/home_page.dart';
import 'package:todo_app/2_application/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home/dashboard',
  routes: [
    GoRoute(
      path: '/home/${SettingsPage.page.key}',
      builder: (context, state) {
        return const SettingsPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return child;
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home/:tab',
          builder: (context, state) {
            return HomePage(
              key: state.pageKey,
              tab: state.params['tab']!,
            );
          },
        ),
        GoRoute(
          path: '/home/overview/${CreateToDoCollection.page.key}',
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Create Collection'),
                leading: BackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      // TODO(Max): use same default route everywhere
                      context.go('/home/overview');
                    }
                  },
                ),
              ),
              body: const SafeArea(child: CreateToDoCollectionProvider()),
            );
          },
        ),
        // TODO(Max): move this to route below with itemId or into own dialog / bottom sheet
        GoRoute(
          path: '/home/overview/${CreateToDoEntry.page.key}',
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Add Entry'),
                leading: BackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      // TODO(Max): use same default route everywhere
                      context.go('/home/overview');
                    }
                  },
                ),
              ),
              body: SafeArea(child: CreateToDoEntryProvider(collectionId: (state.extra! as CollectionId))),
            );
          },
        ),
        GoRoute(
          path: '/home/overview/:todoId',
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Details'),
                leading: BackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      // TODO(Max): use same default route everywhere
                      context.go('/home/overview');
                    }
                  },
                ),
              ),
              body: ToDoDetailProvider(
                key: state.pageKey,
                collectionId: CollectionId.fromUniqueString(state.params['todoId']!),
              ),
            );
          },
        ),
      ],
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPush: ${route.settings.name}'); //name comes back null
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('didPop: ${route.settings.name}'); //name comes back null
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    debugPrint('didRemove - route: ${route.settings.name} previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('didReplace: ${newRoute?.settings.name}'); //name comes back null
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    debugPrint('didStartUserGesture: ${route.settings.name}'); //name comes back null
  }

  @override
  void didStopUserGesture() {
    debugPrint('didStopUserGesture'); //name comes back null
  }
}
