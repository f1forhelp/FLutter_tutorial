import 'package:flutter/material.dart';

class DasboardPage extends StatefulWidget {
  const DasboardPage({super.key});

  @override
  State<DasboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DasboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: const Column(),
    );
  }
}
