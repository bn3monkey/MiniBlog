import 'package:flutter/material.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height * 0.2;             
    double height = screen_height > 100.0 ? screen_height : 100.0;
    double upper_header_height = height * 0.7;
    return Container(
        height: height,
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
            TagView(height : ,)
          ]
        ),
      );
  }
}
