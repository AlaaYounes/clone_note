import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  CustomText({required this.text, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      ),
    );
  }
}
