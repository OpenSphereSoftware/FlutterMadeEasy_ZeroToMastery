import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
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
          path: '/home/overview/:todoId',
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
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
              body: TodoDetail(
                key: state.pageKey,
                id: UniqueID.fromUniqueString(state.params['todoId']!),
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
