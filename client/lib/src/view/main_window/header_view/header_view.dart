import 'package:flutter/material.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 120.0;
    double upper_header_height = height * 0.7;
    double tag_view_height = height - upper_header_height;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('image/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: <Widget>[
        UpperHeaderView(
          height: upper_header_height,
        ),
        TagView(
          height: tag_view_height,
        )
      ]),
    );
  }
}
