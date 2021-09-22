import 'package:flutter/material.dart';

class WhiteBorderButton extends StatelessWidget {
  WhiteBorderButton({
    Key? key,
    required this.data,
    required this.padding,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  final String data;
  final EdgeInsets padding;
  final double fontSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        data,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400,
        ),
      ),
      style: OutlinedButton.styleFrom(
          padding: padding, side: BorderSide(width: 1.5, color: Colors.white)),
    );
  }
}
