import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';

class InheritedWidgetSimple extends StatefulWidget {
  const InheritedWidgetSimple({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetSimple> createState() => _InheritedWidgetSimpleState();
}

class _InheritedWidgetSimpleState extends State<InheritedWidgetSimple> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return SateteInheritedWidget(
      counter: counter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inherited Example"),
        ),
        body: Column(
          children: [
            const TWidget(),
            CustomTextButton(
              onTap: () {
                counter++;
                setState(() {});
              },
              title: "Increase Counter",
            ),
            const _TempContainr(),
          ],
        ),
      ),
    );
  }
}

class TWidget extends StatefulWidget {
  const TWidget({Key? key}) : super(key: key);

  @override
  State<TWidget> createState() => _TWidgetState();
}

class _TWidgetState extends State<TWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies - TWdiget");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}

class _TempContainr extends StatefulWidget {
  const _TempContainr({Key? key}) : super(key: key);

  @override
  State<_TempContainr> createState() => _TempContainrState();
}

class _TempContainrState extends State<_TempContainr> {
  @override
  void didChangeDependencies() {
    print("didChangeDependencies - _TempContainr");
    super.didChangeDependencies();
  }

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
    // return oldWidget.counter != counter;
    return true;
  }
}
