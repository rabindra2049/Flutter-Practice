import 'package:adavance_go_router/feature/dashboard/dashboard_page.dart';
import 'package:adavance_go_router/feature/settings/settings_page.dart';
import 'package:adavance_go_router/feature/timeline/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final homeControllerProvider = StateProvider<int>((ref) => 0);

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(homeControllerProvider);
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: position,
        onTap: (index) {
          ref.read(homeControllerProvider.notifier).update((state) => index);
          switch (index) {
            case 0:
              context.go(DashboardPage.route);
            case 1:
              context.go(TimelinePage.route);
            case 2:
              context.go(SettingsPage.route);
            default:
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade300,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time, size: 30), label: 'Timeline'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30), label: 'Settings'),
        ]);
  }
}
