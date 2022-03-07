import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetExample> createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return SateteInheritedWidget(
      counter: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inherited Example"),
        ),
        body: Column(
          children: const [
            Text("data"),
            _TempContainr(),
          ],
        ),
      ),
    );
  }
}

class _TempContainr extends StatelessWidget {
  const _TempContainr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? counter = context
        .dependOnInheritedWidgetOfExactType<SateteInheritedWidget>()
        ?.counter;

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Text("Increment : Value = ${counter}"),
      ),
    );
  }
}

class SateteInheritedWidget extends InheritedWidget {
  final int counter;

  const SateteInheritedWidget(
      {Key? key, required this.counter, required Widget child})
      : super(key: key, child: child);

  static SateteInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SateteInheritedWidget>();

  @override
  bool updateShouldNotify(covariant SateteInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}
