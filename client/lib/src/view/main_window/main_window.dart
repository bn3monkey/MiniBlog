import 'package:flutter/material.dart';
import './main_window_name.dart';
import '../window_name.dart';

class MainWindow extends StatefulWidget {
  MainWindow({Key? key, required this.onWindowChanged}) : super(key: key);

  final ChangeWindowCallback onWindowChanged;

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  MainContentName current_name = MainContentName.EMPTY;

  void _changeContent(MainContentName name) {
    setState(() {
      current_name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (current_name) {
      case MainContentName.EMPTY:
        return Container(color: Colors.blueAccent);
        break;
      case MainContentName.LIST:
        return Container(color: Colors.blueGrey);
        break;
      case MainContentName.WRITE:
        return Container(color: Colors.lightBlue);
        break;
      case MainContentName.RETREIVE:
        return Container(color: Colors.lightBlueAccent);
        break;
    }
  }
}
