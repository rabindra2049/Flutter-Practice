import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/cast_list.dart';
import 'package:riverpod_project_one/view/widgets/cast_list_widget.dart';

void main() {
  setUpAll(() async {});
  group("Cast List Provider Test", () {
    testWidgets('CircularProgress', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
            overrides: [
              castProvider.overrideWithValue(const AsyncValue.loading()),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: CastList(),
              ),
            )),
      );

      final circularProgressIndicatorWidget =
          find.byType(CircularProgressIndicator);
      expect(circularProgressIndicatorWidget, findsOneWidget);
    });
    testWidgets('Error', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
            overrides: [
              castProvider.overrideWithValue(const AsyncValue.error("Error")),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: CastList(),
              ),
            )),
      );

      final circularProgressIndicatorWidget =
          find.byType(CircularProgressIndicator);
      expect(circularProgressIndicatorWidget, findsNothing);

      expect(find.byKey(ValueKey("errorKey")), findsOneWidget);
      expect(find.text("Error"), findsOneWidget);
    });

    testWidgets('CastList render correctly', (WidgetTester tester) async {
      //Create sample cast data
      final castData = Cast(
        id: 1,
        cast: [
          Casts(
            adult: false,
            gender: 1,
            id: 100,
            known_for_department: 'Acting',
            name: 'John Doe',
            original_name: 'John Doe',
            popularity: 9.8,
            profile_path: '/profile.jpg',
            cast_id: 1234,
            character: 'Character Name',
            credit_id: 'credit_id',
            order: 1,
          ),
          Casts(
            adult: false,
            gender: 0,
            id: 101,
            known_for_department: 'Acting',
            name: 'John Doe',
            original_name: 'John Doe',
            popularity: 9.8,
            profile_path: '/profile.jpg',
            cast_id: 1234,
            character: 'Character Name',
            credit_id: 'credit_id',
            order: 1,
          ),
        ],
      );

      //Create a mock CastProvider
      await tester.pumpWidget(
        ProviderScope(
            overrides: [
              castProvider.overrideWithValue(AsyncValue.data(castData)),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: CastList(),
              ),
            )),
      );

      final circularProgressIndicatorWidget =
          find.byType(CircularProgressIndicator);
      expect(circularProgressIndicatorWidget, findsNothing);

      expect(find.byType(CastListWidget), findsOneWidget);
    });
  });
}
