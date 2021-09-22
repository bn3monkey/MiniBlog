import 'package:flutter/material.dart';
import 'package:client/src/auxiliary/asset_path.dart';

class UserWindow extends StatefulWidget {
  UserWindow({Key? key}) : super(key: key);

  @override
  _UserWindowState createState() => _UserWindowState();
}

class _UserWindowState extends State<UserWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: 350,
        height: 425,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                AssetPath.to(context, "image/userwindow_background.png")),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
