import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'korea_monkey_icons.dart';

class TitleView extends StatelessWidget {
    TitleView({Key? key, required this.size}) : super(key : key);
    final double size;

    @override
    Widget build(BuildContext context)
    {
        return
            Row(
                children : <Widget>[
                    FittedBox(
                        fit : BoxFit.scaleDown,
                        alignment : Alignment.centerLeft,
                        child : Text(
                            '조선원숭이 ',
                            style: TextStyle(
                                fontSize : size,
                                fontFamily : 'Shinb7',
                                color: Colors.white
                            ),
                        ),
                    ),
                    /*
                    Image(
                        image : AssetImage('image/title_icon.png'),
                        width : 30.0,
                        height : 30.0,
                    ),
                    */
                    Icon(
                        KoreaMonkey.korea_monkey,
                        color : Colors.white,
                        size : size)                   
                    
                ]
            );
    }
}