import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/widget/white_border_button.dart';
import 'package:client/src/widget/white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';

class SignupView extends StatefulWidget {
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  Widget getTitleView(BuildContext context) {
    var text = Row(children: <Widget>[
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '댓글부대 되기',
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

  final email_text = TextEditingController();
  final nickname_text = TextEditingController();
  final password_text = TextEditingController();
  final passwordagain_text = TextEditingController();
  String toast_message = "";

  void showToastMessage() {
    setState(() {
      if (email_text.text == "")
        toast_message = "이메일 주소를 입력해주세요.";
      else if (nickname_text.text == "")
        toast_message = "별명을 입력해주세요.";
      else if (password_text.text == "")
        toast_message = "비밀번호를 입력해주세요";
      else if (passwordagain_text.text == "")
        toast_message = "비밀 번호를 다시 입력해주세요.";
      else if (password_text.text != passwordagain_text.text)
        toast_message = "비밀번호가 일치하지 않습니다.";
      else
        toast_message = "";
    });
  }

  Widget getEmailView(BuildContext context) {
    var email_form = WhiteTextField(
      hint: "전자 편지 주소",
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      fontSize: 15.0,
      controller: email_text,
      onSubmitted: (text) {
        showToastMessage();
      },
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: email_form,
    );
  }

  Widget getNickNameView(BuildContext context) {
    var nickname_form = WhiteTextField(
      hint: "별명",
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      fontSize: 15.0,
      controller: nickname_text,
      onSubmitted: (text) {
        showToastMessage();
      },
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: nickname_form,
    );
  }

  Widget getPasswordView(BuildContext context) {
    var password_form = WhiteTextField(
        hint: "비밀번호",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 15.0,
        controller: password_text,
        onSubmitted: (text) {
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: password_form,
    );
  }

  Widget getPasswordAgainView(BuildContext context) {
    var passwordagain_form = WhiteTextField(
        hint: "비밀번호 다시 입력",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 15.0,
        controller: passwordagain_text,
        onSubmitted: (text) {
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: passwordagain_form,
    );
  }

  String thumbnail_path = "";
  //String thumbnail_path = "image/test/profile1.png";
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

  Widget getSignUpButtonView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "가입",
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {},
      ),
    );
  }

  Widget getCancelButtonView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "취소",
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
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
            Expanded(child: Container()),
            getEmailView(context),
            getNickNameView(context),
            getPasswordView(context),
            getPasswordAgainView(context),
            getThumbNailView(context),
            getToastMessageView(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSignUpButtonView(context),
                  getCancelButtonView(context),
                ],
              ),
            )
          ],
        ));
  }
}
