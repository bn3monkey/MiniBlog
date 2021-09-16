import 'package:flutter/material.dart';
import 'package:client/src/model/post_head.dart';

class NonMobilePostView {
  NonMobilePostView({required this.post_head});

  final PostHead post_head;

  static const double height = 250.0;
  static const double thumbnail_height = height * 0.8;
  static const double thumbnail_width = height * 1.2;

  static const top_vertical_ratio = 4;
  static const middle_vertical_ratio = 3;
  static const bottom_vertical_ratio =
      10 - top_vertical_ratio - middle_vertical_ratio;

  Widget getThumbnailView() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
    return Expanded(
        child: Column(children: [
      getTitleView(),
      getTagsView(),
      getViewsView(),
    ]));
  }

  Widget getTitleView() {
    return Expanded(
        flex: top_vertical_ratio,
        child: Container(
          alignment: Alignment.centerLeft,
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: Text(
            post_head.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }

  Widget getTagsView() {
    return Expanded(
        flex: middle_vertical_ratio,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
              children: List<Widget>.generate(post_head.tags.length, (idx) {
            return Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
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
        ));
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
    return Expanded(
        flex: bottom_vertical_ratio,
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("조회수 : ${post_head.views}회", style: textStyle),
              ),
              Text("|", style: textStyle),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(convertDateTime(post_head.creation_date),
                    style: textStyle),
              ),
            ])));
  }

  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding:
            EdgeInsets.only(top: 30.0, bottom: 30.0, left: 20.0, right: 20.0),
        child: Row(children: [
          getThumbnailView(),
          getInfoView(),
        ]));
  }
}
