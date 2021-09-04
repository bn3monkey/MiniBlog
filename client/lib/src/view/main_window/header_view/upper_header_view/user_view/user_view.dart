import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  UserView({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String path = "";

  void _changeIcon(String path) {
    setState(() {
      this.path = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    return Container(
      width : size,
      height : size,
      decoration : const BoxDecoration(
        color : Colors.white,
        shape : BoxShape.circle
      ),
      child : Container(
        width : size * 0.2,
        height : size * 0.2,
        decoration : const BoxDecoration(
          color : Colors.white,
          shape : BoxShape.circle
        )
      )
    );
  }
}
