import 'package:flutter/material.dart';

import 'package:client/src/auxiliary/asset_path.dart';

import 'package:client/src/model/user.dart';
import 'package:client/src/model/comment.dart';

import 'comment_item_view.dart';

class CommentView extends StatefulWidget {
  CommentView({Key? key, required this.comments}) : super(key: key);

  final List<Comment> comments;
  User current_user =
      User(id: 6, name: "샌즈", profile: "image/test/profile2.png");

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  bool is_log_in = true;
  final comment_text = TextEditingController();

  Widget getSumView(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 12.0, bottom: 20.0),
        alignment: Alignment.centerLeft,
        child: Text(
          "댓글 ${widget.comments.length}개",
          style: TextStyle(
              color: Color(0xff707070),
              fontSize: 18,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400),
        ));
  }

  Widget getThumbnailView(BuildContext context) {
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

  Widget getInputView(BuildContext context) {
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
          controller: comment_text,
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
              hintText: "원숭이에게 관심을 주세요.")),
    );
  }

  Widget getPanelView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            comment_text.clear();
          },
          child: Text("취소",
              style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
        TextButton(
          onPressed: () {},
          child: Text("댓글",
              style: TextStyle(
                  color: Color(0xff005555),
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget getWriteView(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getThumbnailView(context),
                Expanded(child: getInputView(context)),
              ],
            ),
            getPanelView(context),
          ],
        ));
  }

  Widget getListView(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.comments.length,
        itemBuilder: (context, int index) {
          return CommentItemView(comment: widget.comments[index]);
        });

    //return Column(children: [CommentItemView(comment: widget.comments[0])]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Column(
        children: [
          getSumView(context),
          getWriteView(context),
          getListView(context),
        ],
      ),
    );
  }
}
