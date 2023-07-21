import 'package:adavance_go_router/feature/dashboard/dashboard_page.dart';
import 'package:adavance_go_router/provider/shared_utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String routeName = 'login';
  static String route = '/login';

  @override
  ConsumerState<LoginPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext con) {
    final sharedUtility = ref.read(sharedUtilityProvider);
    print(sharedUtility.isAuthenticate());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
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
                  context.go(DashboardPage.route);
                } else {
                  sharedUtility.setAuthenticate(isLogin: false);
                }

                print('switched to: $index');
              },
            ),
          ],
        ),
      ),
    );
  }
}
