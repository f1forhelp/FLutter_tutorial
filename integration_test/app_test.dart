// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/main.dart' as app;
import 'package:integration_test/integration_test.dart';

//------------8u8u8u------
//-----------ajsnjasn------

//-----asknask=---------
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 5));

    final Finder emailField = find.byKey(ValueKey("email"));
    final Finder passField = find.byKey(ValueKey("pass"));
    final Finder validateButton = find.byKey(ValueKey("validate"));

    expect(find.byType(MyHomePage), findsOneWidget);

    await tester.tap(emailField);
    await tester.enterText(emailField, "test@gmail.com");
    expect(find.text('test@gmail.com'), findsOneWidget);
    await Future.delayed(Duration(seconds: 2));

    await tester.tap(passField);
    await tester.enterText(passField, "admin");
    expect(find.text('admin'), findsOneWidget);
    await Future.delayed(Duration(seconds: 2));

    await tester.tap(validateButton);
    await Future.delayed(Duration(seconds: 2));
    // await Future.delayed(Duration(seconds: 10));

    await tester.pumpAndSettle();

    expect(find.byType(SecuredContent), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
