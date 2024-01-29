import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  String? hintText;
  bool isPassword;
  Widget? suffixIcon;
  TextEditingController controller;
  void Function(String)? onChange;
  CustomTextField({
    this.hintText,
    this.isPassword = false,
  this.suffixIcon,
    required this.controller,
    this.onChange,
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide(color: Colors.black, width: 2),
        // ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide(color: Colors.black, width: 2),
        // ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.grey
        ),
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      obscureText: isPassword,
      controller: controller,
      onChanged: onChange,
    );
  }
}
