import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/dark_example/constants.dart';

class DarkNeuMorphicExample2 extends StatefulWidget {
  const DarkNeuMorphicExample2({Key? key}) : super(key: key);

  @override
  _DarkNeuMorphicExample2State createState() => _DarkNeuMorphicExample2State();
}

class _DarkNeuMorphicExample2State extends State<DarkNeuMorphicExample2> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            CustomNeumorphicCircle(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Icon(Icons.android, color: Colors.white, size: 100),
              ),
              backGroundColor: Constants.backgroundColor,
              enableOuterShadow: true,
              highlightColor: Constants.softHighlightColor,
              shadowColor: Constants.softShadowColor,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Constants.softHighlightColor,
                    offset: Offset(-10, -10),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Constants.softShadowColor,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNeumorphicCircle extends StatelessWidget {
  final Color backGroundColor;
  final Color highlightColor;
  final Color shadowColor;
  final bool enableOuterShadow;
  final bool enableInnerShadow;
  final Widget child;
  const CustomNeumorphicCircle(
      {Key? key,
      required this.backGroundColor,
      required this.enableOuterShadow,
      required this.highlightColor,
      required this.shadowColor,
      required this.child,
      this.enableInnerShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: child,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backGroundColor,
            boxShadow: enableOuterShadow
                ? [
                    BoxShadow(
                      color: highlightColor,
                      offset: const Offset(-10, -10),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: shadowColor,
                      offset: const Offset(10, 10),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
        ),
      ],
    );
  }
}
