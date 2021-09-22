import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';
import 'package:client/src/widget/circle_border_button.dart';

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
    return CircleBorderButton(
        onPressed: () {},
        size: size,
        child: Icon(KoreaMonkey.info, color: Colors.white, size: 0.9 * size));
  }
}
