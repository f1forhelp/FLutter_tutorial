import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final bool isLoading;
  final String label;
  final Function()? onTap;
  const CustomTextButton({
    super.key,
    required this.isLoading,
    required this.label,
    required this.onTap,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      child: widget.isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )
          : Text(widget.label),
    );
  }
}
