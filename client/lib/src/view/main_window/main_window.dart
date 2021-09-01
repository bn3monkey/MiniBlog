import 'package:flutter/material.dart';
import './main_window_name.dart';
import '../window_name.dart';
import 'header_view/header_view.dart';
import 'content_view/content_view.dart';

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
    return Column(
      children: [
        HeaderView(
          onWindowChanged: widget.onWindowChanged,
        ),
        Expanded(
            child: ContentView(
          onWindowChanged: widget.onWindowChanged,
        ))
      ],
    );
  }
}
