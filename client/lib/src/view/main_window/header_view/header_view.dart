import 'package:flutter/material.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';
import 'package:client/src/auxiliary/asset_path.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 120.0;
    double upper_header_height = height * 0.7;
    double tag_view_height = height - upper_header_height;
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.to(context, 'image/banner.png')),
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
