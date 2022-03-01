import 'package:flutter/material.dart';
import 'package:flutter_tutorial/dark_example/dark_neumorhphic_example.dart';
import 'package:flutter_tutorial/dark_example2/dark_neumorphic2.dart';

void main() {
  Paint.enableDithering = true;
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
      home: DarkNeuMorphicExample2(),
    );
  }
}
