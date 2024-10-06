import 'package:flutter/material.dart';

void scaffoldmessenger(
    {required BuildContext context,
    required String text,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    ),
  );
}
