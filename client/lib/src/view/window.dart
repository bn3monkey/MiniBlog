import 'dart:html';

import 'package:flutter/material.dart';
import 'main_window/main_window.dart';
import 'user_window/user_window.dart';

class Window extends StatefulWidget {
  Window({Key? key}) : super(key: key);

  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: MainWindow(),
    );
  }
}
