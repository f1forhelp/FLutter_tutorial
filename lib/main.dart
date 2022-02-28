import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            // Text(
            //   "This is Neumorphic",
            // ),
            CustomNeuMorphicButton(),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              height: 200,
              child: Icon(
                Icons.android,
                size: 80,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
                gradient: LinearGradient(
                  colors: [Color(0xFF9E9E9E), Colors.white, Color(0xFF9E9E9E)],
                  begin: Alignment.topLeft,
                  // stops: [0.5, 0.8],
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF9E9E9E),
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 15,
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

class CustomNeuMorphicButton extends StatefulWidget {
  const CustomNeuMorphicButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNeuMorphicButton> createState() => _CustomNeuMorphicButtonState();
}

class _CustomNeuMorphicButtonState extends State<CustomNeuMorphicButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   _isTapped = _isTapped ? false : true;
      //   setState(() {});
      // },
      onTapUp: (v) {
        _isTapped = false;
        setState(() {});
        print("tapCancel");
      },
      onTapDown: (v) {
        _isTapped = true;
        setState(() {});
        print("Tapped Down");
      },
      onTapCancel: () {
        _isTapped = false;
        setState(() {});
        print("tapCancel");
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        width: 200,
        height: 200,
        child: Icon(
          Icons.android,
          size: 80,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
          gradient: _isTapped
              ? RadialGradient(
                  colors: [Color(0xFF9E9E9E), Colors.white],
                  center: Alignment.topLeft,
                  radius: 0.8,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF9E9E9E),
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    Color color = Color.lerp(this, another, amount) ?? const Color(0xFF000000);

    return color;
  }
}
