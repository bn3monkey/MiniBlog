import 'dart:html';

import 'package:flutter/material.dart';

class BoardView extends StatefulWidget {
  BoardView({Key? key}) : super(key: key);

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    //return ListView.builder(
    //itemCount : data.length
    // itemBuilder : (context, int index) {
    //  return getBoard(context, index);
    // }
    //)
  }

  Widget getBoard(BuildContext context, int index) {
    return Container();
  }
}
