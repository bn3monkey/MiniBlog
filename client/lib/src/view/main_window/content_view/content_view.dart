import 'package:flutter/material.dart';
import '../../window_name.dart';

class ContentView extends StatefulWidget {
  ContentView({Key? key, required this.onWindowChanged}) : super(key: key);

  final ChangeWindowCallback onWindowChanged;

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
