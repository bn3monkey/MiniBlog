import 'package:flutter/material.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double parent_height = MediaQuery.of(context).size.height * 0.2;
    double upper_header_height = parent_height * 0.7;
    return Container(
        height: parent_height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('image/banner.png'),
            fit: BoxFit.cover,
          ),
        ),
        child : Column(
          children : <Widget>[
            UpperHeaderView(
              height : upper_header_height,
            ),
          ]
        ),
      );
  }
}
