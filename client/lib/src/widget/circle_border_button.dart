import 'package:flutter/material.dart';

class CircleBorderButton extends StatelessWidget {
  CircleBorderButton({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: child,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(color: Colors.white, width: 2.0)));
  }
}
