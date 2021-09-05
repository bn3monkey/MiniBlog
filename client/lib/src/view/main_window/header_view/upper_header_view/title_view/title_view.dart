import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
    TitleView({Key? key}) : super(key : key);

    @override
    Widget build(BuildContext context)
    {
        return Text(
            '조선원숭이🐒',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
        );
    }
}