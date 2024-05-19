import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.top,
    required this.bottom,
    this.isShown = false,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isShown;
  final Radius top;
  final Radius bottom;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isShown ? isShown : false,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: top,
            topRight: top,
            bottomLeft: bottom,
            bottomRight: bottom,
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: top,
            topRight: top,
            bottomLeft: bottom,
            bottomRight: bottom,
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}
