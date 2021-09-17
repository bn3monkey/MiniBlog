import 'package:flutter/material.dart';
import 'package:client/src/model/post_head.dart';
import 'package:client/src/model/post.dart';
import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/model/comment.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MobileRetrieveView extends StatelessWidget {
  MobileRetrieveView({Key? key, required this.post});

  final Post post;

  static const double thumbnail_height = 100;
  static const double thumbnail_width = thumbnail_height * 1.5;
  static const double half_thumbnail_height = thumbnail_height / 2;

  Widget getThumbnailView(BuildContext context) {
    var thumbnail = post.head.thumbnail;

    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      alignment: Alignment.center,
      child: Image.asset(
        AssetPath.to(context, thumbnail),
        height: 100,
        width: 150,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget getTitleView(BuildContext context) {
    var title = post.head.title;
    return Container(
        height: half_thumbnail_height,
        alignment: Alignment.centerLeft,
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700,
          ),
        ));
  }

  Widget getTagView(BuildContext context) {
    return Container(
      height: half_thumbnail_height,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5.0),
      child: Row(
          children: List<Widget>.generate(post.head.tags.length, (idx) {
        return Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 3.0, bottom: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff3BDC9A),
              ),
              child: Text(post.head.tags[idx],
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w300,
                  )),
            ));
      })),
    );
  }

  Widget getInfoView(BuildContext context) {
    return Column(children: [
      getTitleView(context),
      getTagView(context),
    ]);
  }

  Widget getViewsView(BuildContext context) {
    var views = post.head.views;
    var creation_date = post.head.creation_date;

    var textStyle = TextStyle(
      color: Color(0xff707070),
      fontSize: 20,
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w300,
    );

    return Container(
      height: half_thumbnail_height,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(5.0),
      child: Row(children: [
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text("조회수 : ${views}회", style: textStyle),
        ),
        Text("|", style: textStyle),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child:
              Text(DateTimeConverter.convert(creation_date), style: textStyle),
        ),
      ]),
    );
  }

  Widget getSuperUserView(BuildContext context) {
    return Container(
      height: half_thumbnail_height,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextButton(
              onPressed: () {},
              child: Text("수정",
                  style: TextStyle(
                      color: Color(0xff005555),
                      fontSize: 20,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextButton(
              onPressed: () {},
              child: Text("삭제",
                  style: TextStyle(
                      color: Color(0xff005555),
                      fontSize: 20,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeaderView(BuildContext context) {
    return Container(
      child: Row(
        children: [
          getThumbnailView(context),
          Expanded(
            child: getInfoView(context),
          ),
          Expanded(
            child: Column(children: [
              getViewsView(context),
              getSuperUserView(context),
            ]),
          )
        ],
      ),
    );
  }

  Widget getContentView(BuildContext context) {
    return Expanded(
      child: Markdown(data: post.content),
    );
  }

  Widget getCommentView(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        getHeaderView(context),
        getContentView(context),
        getCommentView(context),
      ],
    ));
  }
}
