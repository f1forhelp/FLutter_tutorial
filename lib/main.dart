import 'package:flutter/material.dart';
import 'package:flutter_tutorial/dark_example/dark_neumorhphic_example.dart';

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
      home: DarkNeuMorphicExample(),
    );
  }
}
