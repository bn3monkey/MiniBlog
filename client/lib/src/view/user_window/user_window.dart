import 'package:flutter/material.dart';
import 'package:client/src/auxiliary/asset_path.dart';

import 'login_view/login_view.dart';
import 'signup_view/signup_view.dart';
import 'password_finding_view/password_finding_view.dart';
import 'thumbnail_resize_view/thumbnail_resize_view.dart';
import 'info_view/info_view.dart';

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
        child: //LoginView(),
            //SignupView(),
            //PasswordFindingView(),
            //ThumbnailResizeView(),
            InfoView(),
      ),
    );
  }
}
