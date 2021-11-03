import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WhiteTextField extends StatelessWidget {
  WhiteTextField({
    Key? key,
    required this.hint,
    required this.padding,
    required this.fontSize,
    required this.onSubmitted,
    this.controller = null,
    this.obscureText = false,
  }) : super(key: key);

  final String hint;
  final EdgeInsets padding;
  final double fontSize;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextField(
            onSubmitted: onSubmitted,
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration.collapsed(
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: fontSize,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                ),
                hintText: hint)));
  }
}
