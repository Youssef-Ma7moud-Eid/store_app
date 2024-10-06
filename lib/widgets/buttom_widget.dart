import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget(
      {super.key, required this.buttomtext, required this.onTap});
  final String buttomtext;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 106, 69, 227)),
          child: Text(
            buttomtext,
            style: const TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
