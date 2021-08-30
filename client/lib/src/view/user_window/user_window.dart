import 'package:flutter/material.dart';
import '../window_name.dart';

class UserWindow extends StatefulWidget {
  UserWindow({Key? key, required this.onWindowChanged}) : super(key: key);

  final ChangeWindowCallback onWindowChanged;

  @override
  _UserWindowState createState() => _UserWindowState();
}

enum UserContentName { LOGIN, SIGNUP, IMAGE_RESIZE, PASSWORD_FINDING, INFO }

class _UserWindowState extends State<UserWindow> {
  UserContentName current_name = UserContentName.LOGIN;

  void _changeContent(UserContentName name) {
    setState(() {
      current_name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (current_name) {
      case UserContentName.LOGIN:
        return Container(color: Colors.green);
        break;
      case UserContentName.SIGNUP:
        return Container(color: Colors.greenAccent);
        break;
      case UserContentName.IMAGE_RESIZE:
        return Container(color: Colors.lightGreen);
        break;
      case UserContentName.PASSWORD_FINDING:
        return Container(color: Colors.lightGreenAccent);
        break;
      case UserContentName.INFO:
        return Container(color: Colors.black);
        break;
    }
  }
}
