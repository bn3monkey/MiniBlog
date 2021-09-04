import 'package:flutter/material.dart';
import 'header_view/header_view.dart';
import 'content_view/content_view.dart';

class MainWindow extends StatelessWidget {
  MainWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HeaderView(), Expanded(child: ContentView())],
    );
  }
}
