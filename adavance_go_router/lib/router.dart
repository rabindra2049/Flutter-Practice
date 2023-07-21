import 'package:adavance_go_router/feature/dashboard/dashboard_page.dart';
import 'package:adavance_go_router/feature/home/home_screen.dart';
import 'package:adavance_go_router/feature/login/login_page.dart';
import 'package:adavance_go_router/feature/settings/settings_page.dart';
import 'package:adavance_go_router/feature/splash/splash_page.dart';
import 'package:adavance_go_router/feature/timeline/timeline_page.dart';
import 'package:adavance_go_router/provider/shared_utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final sharedUtility = ref.watch(sharedUtilityProvider);
  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      final lMatch = state.matchedLocation;
      final isAuthenticated = sharedUtility.isAuthenticate();
      if (isAuthenticated) {
        return DashboardPage.route;
      } else {
        if (lMatch == SplashScreenPage.route) {
          return SplashScreenPage.route;
        }
      }
    },
    navigatorKey: rootNavigator,
    initialLocation: SplashScreenPage.route,
    routes: [
      GoRoute(
        path: SplashScreenPage.route,
        name: SplashScreenPage.routeName,
        builder: (_, __) => const SplashScreenPage(),
      ),
      GoRoute(
        path: LoginPage.route,
        name: LoginPage.routeName,
        builder: (_, __) => const LoginPage(),
        routes: [
          //details
        ]
      ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (_, state, child) =>
              HomeScreen(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: DashboardPage.route,
              name: DashboardPage.routeName,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: DashboardPage(
                  key: state.pageKey,
                ));
              },
            ),
            GoRoute(
              path: TimelinePage.route,
              name: TimelinePage.routeName,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: TimelinePage(
                  key: state.pageKey,
                ));
              },
            ),
            GoRoute(
              path: SettingsPage.route,
              name: SettingsPage.routeName,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: SettingsPage(
                  key: state.pageKey,
                ));
              },
            ),
          ]),
    ],
  );
});
