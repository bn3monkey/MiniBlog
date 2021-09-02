import 'dart:html';

import 'package:flutter/material.dart';
import 'main_window/main_window.dart';
import 'user_window/user_window.dart';
import 'window_name.dart';

class Window extends StatefulWidget {
  Window({Key? key}) : super(key: key);

  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  WindowName current_name = WindowName.MAIN;

  void _changeWindow(WindowName target_window) {
    setState(() {
      current_name = target_window;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (current_name) {
      case WindowName.MAIN:
        return MainWindow();
        break;
      case WindowName.USER:
        return UserWindow();
        break;
    }
  }
}
