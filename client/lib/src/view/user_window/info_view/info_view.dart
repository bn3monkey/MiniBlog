import 'package:flutter/material.dart';
import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';
import 'package:client/src/widget/white_border_button.dart';
import 'package:client/src/widget/white_textfield.dart';

class InfoView extends StatefulWidget {
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  String toast_message = "";
  String thumbnail_path = "";
  //String thumbnail_path = "image/test/profile1.png";

  final previous_password_text = TextEditingController();
  final new_password_text = TextEditingController();
  final new_password_again_text = TextEditingController();

  void showToastMessage() {
    setState(() {
      if (previous_password_text.text == "")
        toast_message = "기존 비밀번호를 입력해주세요.";
      else if (new_password_text.text == "")
        toast_message = "새 비밀번호를 입력해주세요.";
      else if (new_password_again_text.text == "")
        toast_message = "새 비밀번호를 다시 입력해주세요";
      else if (new_password_text.text != new_password_again_text.text)
        toast_message = "비밀번호가 일치하지 않습니다.";
      else
        toast_message = "";
    });
  }

  Widget getTitleView(BuildContext context) {
    var text = Row(children: <Widget>[
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '댓글부대 정보',
          style: TextStyle(
              fontSize: 30, fontFamily: 'Shinb7', color: Colors.white),
        ),
      ),
      Icon(KoreaMonkey.title_icon, color: Colors.white, size: 28)
    ]);
    return Row(children: [
      Container(
          alignment: Alignment.topLeft,
          child: TextButton(onPressed: () {}, child: text)),
      Expanded(child: Container())
    ]);
  }

  Widget getThumNailButtonView(BuildContext context) {
    var button = thumbnail_path == ""
        ? ElevatedButton(
            onPressed: () {},
            child: Icon(KoreaMonkey.plus, color: Colors.grey, size: 45.0),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.0),
                primary: Colors.white,
                onPrimary: Colors.white.withOpacity(0.5)))
        : OutlinedButton(
            onPressed: () {},
            child: ClipOval(
                child: Image.asset(AssetPath.to(context, thumbnail_path),
                    width: 70.0, height: 70.0)),
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              side: BorderSide(width: 1.5, color: Colors.white),
            ));

    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
      child: button,
    );
  }

  Widget getThumbNailTextView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Text(
            "얼굴 사진",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'NotoSans',
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          '''옆의 동그라미를 눌러
얼굴 사진을 올려주세요.''',
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'NotoSans',
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget getThumbNailView(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(children: [
          getThumNailButtonView(context),
          getThumbNailTextView(context),
        ]));
  }

  Widget getToastMessageView(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(toast_message,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w500,
            )));
  }

  Widget getPreviousPasswordView(BuildContext context) {
    var password_form = WhiteTextField(
        hint: "기존 비밀번호",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 15.0,
        controller: previous_password_text,
        onSubmitted: (text) {
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: password_form,
    );
  }

  Widget getNewPasswordView(BuildContext context) {
    var password_form = WhiteTextField(
        hint: "새 비밀번호",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 15.0,
        controller: new_password_text,
        onSubmitted: (text) {
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: password_form,
    );
  }

  Widget getNewPasswordAgainView(BuildContext context) {
    var password_form = WhiteTextField(
        hint: "새 비밀번호 다시 입력",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 15.0,
        controller: new_password_again_text,
        onSubmitted: (text) {
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: password_form,
    );
  }

  Widget getPasswordView(BuildContext context) {
    return Container(
        child: Column(
      children: [
        getPreviousPasswordView(context),
        getNewPasswordView(context),
        getNewPasswordAgainView(context),
        getToastMessageView(context),
      ],
    ));
  }

  Widget getPasswordChangeView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "비밀번호 변경",
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {
          showToastMessage();
        },
      ),
    );
  }

  Widget getBackView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "뒤로",
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            getTitleView(context),
            Expanded(flex: 1, child: Container()),
            getThumbNailView(context),
            Expanded(flex: 1, child: Container()),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
              thickness: 2,
              color: Colors.grey,
            ),
            Expanded(flex: 1, child: Container()),
            getPasswordView(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getPasswordChangeView(context),
                  getBackView(context),
                ],
              ),
            )
          ],
        ));
  }
}
