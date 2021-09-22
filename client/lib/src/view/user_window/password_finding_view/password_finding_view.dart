import 'package:client/src/widget/white_border_button.dart';
import 'package:client/src/widget/white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';

class PasswordFindingView extends StatefulWidget {
  _PasswordFindingViewState createState() => _PasswordFindingViewState();
}

class _PasswordFindingViewState extends State<PasswordFindingView> {
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

  Widget getConfirmView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "확인",
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {},
      ),
    );
  }

  Widget getGuideView() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          '''메일로
새로운 비밀번호를 보냈습니다.
확인해주세요!''',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w300,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            getTitleView(),
            Expanded(flex: 1, child: Container()),
            getGuideView(),
            getConfirmView(),
            Expanded(flex: 1, child: Container()),
          ],
        ));
  }
}
