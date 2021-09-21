import 'package:flutter/material.dart';

import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';

import 'package:client/src/model/user.dart';
import 'package:client/src/model/comment.dart';

import 'reply_view.dart';

class CommentItemView extends StatefulWidget {
  CommentItemView({Key? key, required this.comment}) : super(key: key);

  final Comment comment;
  User current_user =
      User(id: 6, name: "샌즈", profile: "image/test/profile2.png");

  @override
  _CommentItemViewState createState() => _CommentItemViewState();
}

class _CommentItemViewState extends State<CommentItemView> {
  bool is_modifying = false;
  bool is_replying = false;

  @override
  initState() {
    super.initState();
    is_modifying = false;
  }

  final comment_text = TextEditingController();
  final reply_text = TextEditingController();

  Widget getThumbnailView(BuildContext context) {
    const size = 20.0;
    return CircleAvatar(
      radius: size + 1,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: size,
        child: ClipOval(
          child:
              Image.asset(AssetPath.to(context, widget.comment.user.profile)),
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
            child: Text(widget.comment.user.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center)),
        Container(
          padding: EdgeInsets.only(right: 1.0),
          child: Text(DateTimeConverter.convert(widget.comment.creation_date),
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
                widget.comment.content,
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
                    comment_text.text = widget.comment.content;
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
        TextButton(
          onPressed: () {
            setState(() {
              is_replying = !is_replying;
            });
          },
          child: Text("답변",
              style: TextStyle(
                  color: Color(0x80005555),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget getWriteThumbNailView(BuildContext context) {
    const size = 20.0;
    return CircleAvatar(
      radius: size + 1,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: size,
        child: ClipOval(
          child:
              Image.asset(AssetPath.to(context, widget.current_user.profile)),
        ),
      ),
    );
  }

  Widget getWriteInputView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.start,
          controller: reply_text,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff707070))),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w300,
              ),
              hintText: "댓글 부대에게 관심을 주세요.")),
    );
  }

  Widget getWritePanelView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            reply_text.clear();
          },
          child: Text("취소",
              style: TextStyle(
                  color: Color(0x80707070),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              is_replying = false;
            });
          },
          child: Text("댓글",
              style: TextStyle(
                  color: Color(0x80005555),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget getWriteView(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getWriteThumbNailView(context),
                Expanded(child: getWriteInputView(context)),
              ],
            ),
            getWritePanelView(context),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
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
            getPanelView(context),
            is_replying ? getWriteView(context) : Container(),
            ReplyView(replies: widget.comment.replies),
          ],
        ));
  }
}
