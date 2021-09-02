import 'package:flutter/material.dart';
import '../../window_name.dart';
import '../main_window_name.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key, required this.onWindowChanged}) : super(key: key);

  final ChangeWindowCallback onWindowChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('image/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
