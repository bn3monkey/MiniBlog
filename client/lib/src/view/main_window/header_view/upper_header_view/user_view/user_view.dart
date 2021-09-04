import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  UserView({Key? key, required this.onWindowChanged}) : super(key: key);

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
