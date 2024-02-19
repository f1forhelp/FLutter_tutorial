import 'package:flutter/material.dart';

class InheritedWidgetExtended extends StatefulWidget {
  const InheritedWidgetExtended({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetExtended> createState() =>
      _InheritedWidgetExtendedState();
}

class _InheritedWidgetExtendedState extends State<InheritedWidgetExtended> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
