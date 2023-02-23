import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.textInputType,
    required this.isPassword,
    required this.hinttext,
  }) : super(key: key);

  final TextInputType textInputType;
  final bool isPassword;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
