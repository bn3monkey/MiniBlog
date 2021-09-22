import 'package:flutter/material.dart';

class CircleBorderButton extends StatelessWidget {
  CircleBorderButton({
    Key? key,
    required this.size,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final double size;
  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: OutlinedButton(
          onPressed: onPressed,
          child: child,
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              shape: CircleBorder(),
              side: BorderSide(width: 1.5, color: Colors.white)),
        ));
  }
}
