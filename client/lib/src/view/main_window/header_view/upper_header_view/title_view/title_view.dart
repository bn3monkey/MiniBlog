import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';

class TitleView extends StatelessWidget {
  TitleView({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          '조선원숭이',
          style: TextStyle(
              fontSize: size, fontFamily: 'Shinb7', color: Colors.white),
        ),
      ),
      Icon(KoreaMonkey.title_icon, color: Colors.white, size: size * 0.9)
    ]);
  }
}
