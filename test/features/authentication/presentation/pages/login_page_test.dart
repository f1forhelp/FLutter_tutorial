import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/core/service/di/app_di.dart';
import 'package:flutter_tutorial/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_button.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:flutter_tutorial/features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  setUp(() {
    AppDi().init();
  });

  group("", () {
    testWidgets("Verify that login page is presented with two textfields",
        (widgetTester) async {
      // widgetTester.view.physicalSize = Size(100, 500);
      await widgetTester.pumpWidget(MaterialApp(
        home: LoginPage(authenticationCubit: AppDi().di()),
      ));
      var emailField = find.byType(CustomTextField);
      expect(emailField, findsNWidgets(2));

      await widgetTester.enterText(emailField.first, "kminchelle");
      await widgetTester.enterText(emailField.last, "0lelplR");

      var loginButton = find.byType(CustomTextButton);
      await widgetTester.tap(loginButton);
      // await widgetTester.tapAndSettle();

      await widgetTester.pumpAndSettle();

      // var loginText = find.text("Login");

      // expect(loginText, findsOneWidget);
      // await widgetTester.pumpAndSettle();
      // var dasboardText = find.text("Dashboard");
      // expect(dasboardText, findsOne);
    });
  });
}
