import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/utils/app_init.dart';
import 'package:flutter_tutorial/features/authentication/presentation/pages/login_page.dart';

void main() {
  AppInit.initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
