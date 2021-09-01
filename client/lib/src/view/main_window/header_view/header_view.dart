import 'package:flutter/material.dart';
import '../../window_name.dart';
import '../main_window_name.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatefulWidget {
  HeaderView({Key? key, required this.onWindowChanged}) : super(key: key);

  final ChangeWindowCallback onWindowChanged;

  @override
  _HeaderViewState createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('image/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
