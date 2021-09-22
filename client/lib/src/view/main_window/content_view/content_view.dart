import 'package:flutter/material.dart';
import 'post_view/post_view.dart';
import 'retrieve_view/retrieve_view.dart';
import 'write_view/write_view.dart';

class ContentView extends StatefulWidget {
  ContentView({Key? key}) : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: //PostView(width: width),
          //RetrieveView(width: width),
          WriteView(),
    );
  }
}
