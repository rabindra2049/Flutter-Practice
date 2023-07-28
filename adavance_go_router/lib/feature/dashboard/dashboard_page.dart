import 'package:adavance_go_router/provider/locale_change_provider.dart';
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
    final sharedUtility = ref.read(sharedUtilityProvider);
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
              initialLabelIndex: sharedUtility.isAuthenticate() ? 0 : 1,
              totalSwitches: 2,
              labels: const ['Logged In', 'Logout'],
              radiusStyle: true,
              onToggle: (index) {
                if (index == 0) {
                  sharedUtility.setAuthenticate(isLogin: true);
                } else {
                  sharedUtility.setAuthenticate(isLogin: false);
                  // context.go(SplashScreenPage.route);
                }
                print('switched to: $index');
              },
            ),
            SizedBox(
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
              initialLabelIndex: sharedUtility.getLocale() == 'en' ? 0 : 1,
              totalSwitches: 2,
              labels: const ['English', 'Germany'],
              radiusStyle: true,
              onToggle: (index) {
                if (index == 0) {
                  ref.read(languageProvider.notifier).update((state) => 'en');
                  sharedUtility.setLocale(locale: 'en');
                } else {
                  ref.read(languageProvider.notifier).update((state) => 'de');
                  sharedUtility.setLocale(locale: 'de');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}