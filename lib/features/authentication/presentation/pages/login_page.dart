import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/utils/extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextFormField(
            hintText: "Email",
          ).h1(),
          const CustomTextFormField(
            hintText: "Password",
          ).h1(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.pink.shade300,
              ),
              child: const Text(
                "SignIn",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ).horizonatlPadding(),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onChange;
  final TextEditingController? textEditingController;

  const CustomTextFormField(
      {Key? key, this.hintText, this.onChange, this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.pink.shade50,
      ),
    );
  }
}
