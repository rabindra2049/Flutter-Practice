import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/login_screen_page.dart';

/*

- Write widget test to test different scenario
 - validate login screen has all those required widgets
- validate email/password both are required field
- validate correct credentials logs in successfully
- validate incorrect credentials throws errors and shows incorrect mesage
 */
void main() {
  // Verify login screen has all those required widgets
  testWidgets('Verify all Login Screen has all required widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreenPage(),
    ));
    await tester.pumpAndSettle();

    expect(find.text("Email"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);
    expect(find.text("Register"), findsOneWidget);
  });

  // validate email/password both are required field
  testWidgets('Validate email/password both are required field',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreenPage(),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Enter your email'), findsNothing);
    expect(find.text('Enter your password'), findsNothing);

    await tester.enterText(find.byKey(ValueKey('email')), '');
    await tester.enterText(find.byKey(ValueKey('password')), '');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
  });


  // validate correct credentials logs in successfully
  testWidgets('Validate correct credentials logs in successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreenPage(),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Success'), findsNothing);

    await tester.enterText(find.byKey(ValueKey('email')), 'rabi@gmail.com');
    await tester.enterText(find.byKey(ValueKey('password')), 'Rabindra');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Success'), findsOneWidget);
  });


  // Validate incorrect credentials throws errors and shows incorrect message
  testWidgets('Validate incorrect credentials throws errors and shows incorrect message',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: LoginScreenPage(),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Failed'), findsNothing);

        await tester.enterText(find.byKey(ValueKey('email')), 'rabindra@gmail.com');
        await tester.enterText(find.byKey(ValueKey('password')), 'Rabindra@123');
        await tester.tap(find.text('Login'));
        await tester.pumpAndSettle();

        expect(find.text('Failed'), findsOneWidget);
      });
}
