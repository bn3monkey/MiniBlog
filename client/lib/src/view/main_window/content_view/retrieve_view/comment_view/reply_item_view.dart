import 'package:flutter/material.dart';

import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';

import 'package:client/src/model/user.dart';
import 'package:client/src/model/reply.dart';

class ReplyItemView extends StatefulWidget {
  ReplyItemView({Key? key, required this.reply}) : super(key: key);

  final Reply reply;
  User current_user =
      User(id: 6, name: "샌즈", profile: "image/test/profile2.png");

  @override
  _ReplyitemViewState createState() => _ReplyitemViewState();
}

class _ReplyitemViewState extends State<ReplyItemView> {
  bool is_modifying = false;

  @override
  initState() {
    super.initState();
    is_modifying = false;
  }

  final comment_text = TextEditingController();

  Widget getThumbnailView(BuildContext context) {
    const size = 20.0;
    return CircleAvatar(
      radius: size + 1,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: size,
        child: ClipOval(
          child: Image.asset(AssetPath.to(context, widget.reply.user.profile)),
        ),
      ),
    );
  }

  Widget getInfoView(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(widget.reply.user.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center)),
        Container(
          padding: EdgeInsets.only(right: 1.0),
          child: Text(DateTimeConverter.convert(widget.reply.creation_date),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center),
        ),
      ],
    ));
  }

  Widget getContentView(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: is_modifying
            ? TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
                controller: comment_text,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff707070))),
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w300,
                    ),
                    hintText: "원숭이에게 관심을 주세요."))
            : Text(
                widget.reply.content,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
              ));
  }

  Widget getPanelView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        is_modifying
            ? TextButton(
                onPressed: () {
                  setState(() {
                    print("확인 -> 수정 ($is_modifying)");
                    is_modifying = false;
                  });
                },
                child: Text("확인",
                    style: TextStyle(
                        color: Color(0x80707070),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
              )
            : TextButton(
                onPressed: () {
                  setState(() {
                    print("수정 -> 확인 ($is_modifying)");
                    comment_text.text = widget.reply.content;
                    is_modifying = true;
                  });
                },
                child: Text("수정",
                    style: TextStyle(
                        color: Color(0x80707070),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
              ),
        TextButton(
          onPressed: () {},
          child: Text("삭제",
              style: TextStyle(
                  color: Color(0x80707070),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getThumbnailView(context),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      getInfoView(context),
                      getContentView(context),
                    ],
                  ),
                ))
              ],
            ),
            getPanelView(context)
          ],
        ));
  }
}
