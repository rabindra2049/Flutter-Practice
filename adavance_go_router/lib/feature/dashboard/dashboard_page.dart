import 'package:adavance_go_router/provider/shared_utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static String routeName = 'dashboard';
  static String route = '/';

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final sharedUtility = ref.watch(sharedUtilityProvider);
    final shareUtilityNotifier = ref.watch(sharedUtilityProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dashboard Screen'),
            ToggleSwitch(
              minWidth: 90.0,
              cornerRadius: 20.0,
              activeBgColors: [
                [Colors.green[800]!],
                [Colors.red[800]!]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              initialLabelIndex: sharedUtility.isAuthenticated ? 0 : 1,
              totalSwitches: 2,
              labels: const ['Logged In', 'Logout'],
              radiusStyle: true,
              onToggle: (index) {
                if (index == 0) {
                  shareUtilityNotifier.setAuthenticate(isLogin: true);
                } else {
                  shareUtilityNotifier.setAuthenticate(isLogin: false);
                  // context.go(SplashScreenPage.route);
                }
                print('switched to: $index');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ToggleSwitch(
              minWidth: 90.0,
              cornerRadius: 20.0,
              activeBgColors: [
                [Colors.green[800]!],
                [Colors.red[800]!]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              initialLabelIndex: sharedUtility.locale == 'en' ? 0 : 1,
              totalSwitches: 2,
              labels: const ['English', 'Germany'],
              radiusStyle: true,
              onToggle: (index) {
                if (index == 0) {
                  shareUtilityNotifier.setLocale(locale: 'en');
                } else {
                  shareUtilityNotifier.setLocale(locale: 'de');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
