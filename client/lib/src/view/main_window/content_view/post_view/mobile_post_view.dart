import 'package:flutter/material.dart';
import 'package:client/src/model/post_head.dart';

class MobilePostView {
  MobilePostView({required this.post_head, required this.width});
  final PostHead post_head;
  final double width;

  late double thumbnail_width = width * 0.8;
  late double thumbnail_height = thumbnail_width * 0.6;
  late double horizontal_padding = (width - thumbnail_width) / 2.5;

  Widget getThumbnailView() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        post_head.thumbnail,
        height: thumbnail_height,
        width: thumbnail_width,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget getInfoView() {
    return Container(
        child: Column(children: [
      getTitleView(),
      getTagsView(),
      getViewsView(),
    ]));
  }

  Widget getTitleView() {
    return Container(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Text(
          post_head.title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700,
          ),
        ));
  }

  Widget getTagsView() {
    return Container(
      padding: EdgeInsets.only(
          left: horizontal_padding,
          right: horizontal_padding,
          top: 5.0,
          bottom: 5.0),
      child: Row(
          children: List<Widget>.generate(post_head.tags.length, (idx) {
        return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 3.0, bottom: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff3BDC9A),
              ),
              child: Text(post_head.tags[idx],
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

  String convertDateTime(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    String hour = date.hour.toString();
    String minute = date.minute.toString();
    return "${year}-${month.padLeft(2, '0')}-${day.padLeft(2, '0')} ${hour.padLeft(2, '0')}-${minute.padLeft(2, '0')}";
  }

  Widget getViewsView() {
    var textStyle = TextStyle(
      color: Color(0xff707070),
      fontSize: 20,
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w300,
    );
    return Container(
        padding: EdgeInsets.only(
            left: horizontal_padding,
            right: horizontal_padding,
            top: 5.0,
            bottom: 5.0),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Text("조회수 : ${post_head.views}회", style: textStyle),
          ),
          Text(
            "|",
            style: textStyle,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(convertDateTime(post_head.creation_date),
                style: textStyle),
          ),
        ]));
  }

  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(children: [
          getThumbnailView(),
          getInfoView(),
        ]));
  }
}
