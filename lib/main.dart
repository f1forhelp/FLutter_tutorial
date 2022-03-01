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
            // CustomNeuMorphicButton(),
            SizedBox(
              height: 100,
            ),
            AnimatedContainer(
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
                // border: Border.lerp(a, b, t),
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromARGB(255, 192, 187, 187),
                //     Color(0xFF9E9E9E)
                //   ],
                //   center: Alignment.center,
                //   radius: 0.8,
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF9E9E9E),
                    offset: const Offset(0, 0),
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

            SizedBox(
              height: 50,
            ),
            AnimatedContainer(
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
                // border: Border.lerp(a, b, t),
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromARGB(255, 192, 187, 187),
                //     Color(0xFF9E9E9E)
                //   ],
                //   center: Alignment.center,
                //   radius: 0.8,
                // ),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 4,
                    blurStyle: BlurStyle.inner,
                  ),
                  BoxShadow(
                      color: Color(0xFF9E9E9E),
                      offset: const Offset(-18, -18),
                      blurRadius: 15,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.inner),
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
  bool _isTapped = true;

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
                  colors: [Color.fromARGB(255, 187, 187, 187), Colors.white],
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
