import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/cast_list.dart';
import 'package:riverpod_project_one/view/widgets/cast_list_widget.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  setUpAll(() async {
    mockHttpClient = MockHttpClient();
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
    final castProvider = Provider<Cast>((ref) => castData);
    await tester.pumpWidget(
      ProviderScope(
          overrides: [
            castProvider.overrideWithValue(castData),
            httpProvider.overrideWithValue(mockHttpClient)
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: CastList(),
            ),
          )),
    );


    final circularProgressIndicatorWidget = find.byType(CircularProgressIndicator);
    expect(circularProgressIndicatorWidget, findsOneWidget);

    await tester.pumpAndSettle();
    expect(circularProgressIndicatorWidget, findsNothing);

    final castListWidgetFinder = find.byType(CastListWidget);
    expect(castListWidgetFinder, findsOneWidget);

    final castListWidget = tester.widget<CastListWidget>(castListWidgetFinder);
    expect(castListWidget.data, castData);
  });
}
