import 'dart:ui';
import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tutorial/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/core/service/di/app_di.dart';
import 'package:flutter_tutorial/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_button.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:flutter_tutorial/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
  late LoginUsecase loginUsecase;
  setUp(() {
    loginUsecase = MockLoginUsecase();
    registerFallbackValue(
        const LoginParams(username: "kminchelle", password: "0lelplR"));
    AppDi().init();
  });

  group("", () {
    testWidgets("Verify that login page is presented with two textfields",
        (widgetTester) async {
      when(() => loginUsecase(any())).thenAnswer((invocation) async =>
          await Future.value(ApiResult.sucess(
              User(id: 1, userName: "_user.empty", token: "_user.token"))));

      var res = await loginUsecase(
          const LoginParams(username: "kminchelle", password: "0lelplR"));
      res.when(sucess: (v) {
        print(v);
      }, failure: (callException) {
        print(callException);
      });

      // widgetTester.view.physicalSize = Size(100, 500);
      await widgetTester.pumpWidget(MaterialApp(
        home: LoginPage(
            authenticationCubit:
                AuthenticationCubit(loginUsecase: loginUsecase)),
      ));
      var emailField = find.byType(CustomTextField);
      expect(emailField, findsNWidgets(2));

      await widgetTester.enterText(emailField.first, "kminchelle");
      await widgetTester.enterText(emailField.last, "0lelplR");

      var loginButton = find.byType(CustomTextButton);
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();
      var dasboardText = find.text("Dashboard");
      expect(dasboardText, findsOne, reason: "Dashboard not found");
    });
  });
}
