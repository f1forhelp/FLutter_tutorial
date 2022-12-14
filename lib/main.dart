import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            key: ValueKey("email"),
            controller: emailController,
          ),
          TextFormField(
            key: ValueKey("pass"),
            controller: passwordController,
          ),
          CustomButton(
            key: ValueKey("validate"),
            label: "Validate",
            onTap: () async {
              // await Future.delayed(Duration(seconds: 4));
              if (emailController.text == "test@gmail.com" &&
                  passwordController.text == "admin") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SecuredContent(key: ValueKey("SecuredContent")),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const CustomButton({super.key, this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(10),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SecuredContent extends StatefulWidget {
  const SecuredContent({super.key});

  @override
  State<SecuredContent> createState() => _SecuredContentState();
}

class _SecuredContentState extends State<SecuredContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            child: Center(
              child: Text(
                "successfully logged in",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
