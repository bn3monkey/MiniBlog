import 'package:client/src/widget/white_border_button.dart';
import 'package:client/src/widget/white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';

class LoginView extends StatefulWidget {
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget getTitleView() {
    var text = Row(children: <Widget>[
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '조선원숭이',
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
  final password_text = TextEditingController();
  String toast_message = "";

  void showToastMessage() {
    setState(() {
      if (password_text.text == "")
        toast_message = "비밀번호를 입력하지 않았습니다.";
      else
        toast_message = "아이디나 비밀번호가 틀렸습니다.";
    });
  }

  Widget getEmailView() {
    var email_form = WhiteTextField(
      hint: "전자 편지 주소",
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      fontSize: 20.0,
      controller: email_text,
      onSubmitted: (text) {
        print("e-mail : ${email_text.text}");
        print("password : ${password_text.text}");
        showToastMessage();
      },
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: email_form,
    );
  }

  Widget getPasswordView() {
    var password_form = WhiteTextField(
        hint: "비밀번호",
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        fontSize: 20.0,
        controller: password_text,
        onSubmitted: (text) {
          print("e-mail : ${email_text.text}");
          print("password : ${password_text.text}");
          showToastMessage();
        },
        obscureText: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: password_form,
    );
  }

  Widget getLoginButtonView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "들어가기",
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {
          print("e-mail : ${email_text.text}");
          print("password : ${password_text.text}");
          showToastMessage();
        },
      ),
    );
  }

  Widget getToastMessageView() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(toast_message,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w500,
            )));
  }

  Widget getTransitionView() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TextButton(
          onPressed: () {},
          child: Text("댓글 부대 되기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w300,
              ))),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            "|",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w300,
            ),
          )),
      TextButton(
          onPressed: () {},
          child: Text("비밀번호 찾기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w300,
              ))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            getTitleView(),
            Expanded(flex: 1, child: Container()),
            getEmailView(),
            getPasswordView(),
            getLoginButtonView(),
            getToastMessageView(),
            Expanded(flex: 1, child: Container()),
            getTransitionView(),
          ],
        ));
  }
}
