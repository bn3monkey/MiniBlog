import 'package:flutter/material.dart';
import 'title_view/title_view.dart';
import 'user_view/user_view.dart';
import 'search_view/search_view.dart';
import 'section_view/section_view.dart';

class UpperHeaderView extends StatelessWidget {
  UpperHeaderView({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    //double search_view_width = screen_width / 3;
    double top_column_size = height / 3.0;
    double bottom_column_size = height / 4.0;

    return Container(
        height: this.height,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
        child: Column(children: <Widget>[
          // Left : Title View - Right : Search View & User View
          Row(children: <Widget>[
            // Title View
            Container(
              padding: EdgeInsets.all(5),
              child: TitleView(size: top_column_size),
            ),
            Expanded(
              child: Container(),
            ),
            // Serach View
            Padding(
                padding: EdgeInsets.all(5),
                child: SearchView(
                  width: 250,
                  height: top_column_size,
                )),
            // User View
            Padding(
              padding: EdgeInsets.all(5),
              child: UserView(size: top_column_size),
            ),
          ]),
          // Right : Section View
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: Container(),
            ),
            SectionView(height: bottom_column_size)
          ]),
        ]));
  }
}
