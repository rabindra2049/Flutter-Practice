import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/main.dart';

void main() {
  testWidgets("MyApp renders MaterialApp", (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    final materialApp = tester.widget<MaterialApp>(materialAppFinder);

    expect(materialApp.title, "Movie App with RiverPod");
    expect(materialApp.routerConfig, isNotNull);
    expect(materialApp.debugShowCheckedModeBanner, false);
  });
}
