import 'package:adavance_go_router/feature/login/login_page.dart';
import 'package:adavance_go_router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static String routeName = 'splash';
  static String route = '/splash';

  @override
  ConsumerState<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      //rootNavigator.currentState.pushNamed(LoginPage.routeName)
      context.goNamed(LoginPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: const Center(
        child: Icon(
          Icons.accessibility_new_rounded,
          size: 150,
          color: Colors.red,
        ),
      ),
    );
  }
}
