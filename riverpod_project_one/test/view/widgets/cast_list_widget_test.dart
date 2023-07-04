import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';
import 'package:riverpod_project_one/view/widgets/cast_list_widget.dart';

//class MockHttpClient extends Mock implements http.Client {}

void main() {
  //late MockHttpClient mockHttpClient;
  setUpAll(() async {
    HttpOverrides.global = null;
    // mockHttpClient = MockHttpClient();
  });
  testWidgets("CastListWidget displays cast data correctly",
      (WidgetTester tester) async {
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
          profile_path: 'iPx1s7EuBEmty7MXdKSBpEBsGYT.jpg',
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
          profile_path: 'liV9OXUeo7T19hhjFlqTELtETnW.jpg',
          cast_id: 1234,
          character: 'Character Name',
          credit_id: 'credit_id',
          order: 1,
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CastListWidget(data: castData),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // expect(find.text("John Doe"), findsNWidgets(1));
  });
}
