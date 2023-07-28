import 'package:adavance_go_router/utils/app_localizations_extension.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);
  static String routeName = 'timeline';
  static String route = '/timeline';

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.appLocalizations.timeLineScreen),
          ],
        ),
      ),
    );
  }
}
