import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hinttext,
    required this.onchanged,
    required this.obscureText,
    required this.input,
  });
  final String hinttext;
  final Function(String)? onchanged;
  final TextInputType? input;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        onChanged: onchanged,
        keyboardType: input,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 141, 137, 137),
            fontSize: 20,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
