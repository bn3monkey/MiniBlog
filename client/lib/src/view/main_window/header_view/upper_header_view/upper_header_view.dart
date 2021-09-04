import 'package:flutter/material.dart';
import 'user_view/user_view.dart';

class UpperHeaderView extends StatelessWidget {
  UpperHeaderView({Key? key, required this.height}): super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    double user_view_size = height/2.0;
    return Container(
        height : this.height,
        decoration : const BoxDecoration(
          color : Color.fromRGBO(0, 0, 0, 0.5),
        ),
        child : Stack(
          children : <Widget>[
            Positioned(
              right : 0, 
              top : 0, 
              child : 
              UserView(
                size : user_view_size
                )
              ),
            ],
        ), 
    );
  }
}
