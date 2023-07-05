import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_project_one/model/cast/cast.dart';
import 'package:riverpod_project_one/model/cast/casts.dart';
import 'package:riverpod_project_one/view/widgets/cast_list_widget.dart';

//class MockHttpClient extends Mock implements http.Client {}

void main() {
  setUpAll(() async {
    HttpOverrides.global = null;
  });
  testWidgets("Renders cast list correctly", (WidgetTester tester) async {
    //Create sample cast data
    final castData = Cast(
      id: 1,
      cast: [
        Casts(
          adult: false,
          gender: 1,
          id: 100,
          known_for_department: 'Acting1',
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
          character: 'Rabindra Acharya',
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
          character: 'Rabindra Acharya',
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
          character: 'Rabindra Acharya',
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
          character: 'Rabindra Acharya',
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
          character: 'Rabindra Acharya',
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

    expect(find.byType(ListTile), findsNWidgets(3));
    expect(find.text("Acting1"), findsNWidgets(1));
    expect(find.byType(CircleAvatar), findsNWidgets(3));
    expect(find.text("Rabindra Acharya"), findsNWidgets(2));
  });

  testWidgets("ListTile will horzontally scroll if cast list more than 3",
      (WidgetTester tester) async {
    //Create sample cast data
    final castData = Cast(
      id: 1,
      cast: [
        Casts(
          adult: false,
          gender: 1,
          id: 100,
          known_for_department: 'Acting1',
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
          character: 'Rabindra Acharya',
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
          character: 'Rabindra Acharya',
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
          character: 'Shyam Acharya',
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

    // Find the ListView widget
    final lastListTileFinder =
        find.byType(ListTile).last; // Find the last ListTile widget

    await tester
        .ensureVisible(lastListTileFinder); // Scroll to the last ListTile
    await tester.pumpAndSettle(); // Wait for animations to complete

    expect(find.text("Shyam Acharya"), findsNWidgets(1));
  });
}
