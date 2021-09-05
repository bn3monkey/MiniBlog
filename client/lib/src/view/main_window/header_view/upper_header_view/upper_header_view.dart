import 'package:flutter/material.dart';
import 'title_view/title_view.dart';
import 'user_view/user_view.dart';

class UpperHeaderView extends StatelessWidget {
  UpperHeaderView({Key? key, required this.height}): super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    double top_column_size = height/3.0;
    return Container(
        height : this.height,
        decoration : const BoxDecoration(
          color : Color.fromRGBO(0, 0, 0, 0.5),
        ),
        child : Column(
          children : <Widget>[
            // Left : Title View - Right : Search View & User View
            Row(
              children : <Widget>[
                // Title View
                Expanded(
                  child : Padding(
                    padding: EdgeInsets.all(5),
                    child : TitleView(
                      size : top_column_size
                    ),
                  )
                ),
                // Serach View
                Container(),
                // User View
                Padding(
                  padding: EdgeInsets.all(5),
                  child : UserView(
                    size : top_column_size
                  ),
                ),                
              ]
            ),
            // Right : Section View
            Row(
              children : <Widget>[
                
              ]
            )
          ]
        )
    );
  }
}
