import 'package:flutter/material.dart';
import 'package:client/src/model/post_head.dart';
import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';

class PostView extends StatefulWidget {
  PostView({Key? key, required this.width}) : super(key: key);

  final double width;
  List<PostHead> post_heads = [
    PostHead(
        id: 1,
        title: "와! 샌즈 아시는구나! 샌즈 겁나 셉니다!",
        section: "개발",
        tags: ["TAG1", "TAG2"],
        views: 12,
        thumbnail: "image/test/thumbnail1.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 2,
        title: "귀여운 피카츄",
        section: "개발",
        tags: ["샌즈", "파피루스", "피카츄라이츄", "파이리?꼬꼬꼬뿌끼", "TAG5"],
        views: 203,
        thumbnail: "image/test/thumbnail2.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 3,
        title: "목욕하는 원숭이",
        section: "개발",
        tags: ["TAG1"],
        views: 1,
        thumbnail: "image/test/thumbnail3.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 4,
        title: "째려보는 원숭이",
        section: "개발",
        tags: ["TAG1"],
        views: 1,
        thumbnail: "image/test/thumbnail4.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 5,
        title: "폴짝",
        section: "개발",
        tags: ["TAG1"],
        views: 23,
        thumbnail: "image/test/thumbnail5.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 6,
        title: "하드락 근본",
        section: "개발",
        tags: ["TAG1", "TAG4"],
        views: 0,
        thumbnail: "image/test/thumbnail6.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 7,
        title: "국카스텐 3집 좀 내",
        section: "개발",
        tags: ["TAG1", "TAG3", "TAG4"],
        views: 33333,
        thumbnail: "image/test/thumbnail7.png",
        creation_date: DateTime.now()),
  ];

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool is_mobile = false;
  double thumbnail_height = 0.0;
  double thumbnail_width = 0.0;
  double item_horizontal_padding = 0.0;

  @override
  Widget build(BuildContext context) {
    var width = widget.width;
    is_mobile = width < 600.0;

    thumbnail_width = is_mobile ? 330 : 240;
    thumbnail_height = is_mobile ? 220 : 160;
    item_horizontal_padding = is_mobile ? 60 : 20;

    print("Mobile? : ${is_mobile}");

    return ListView.builder(
        itemCount: widget.post_heads.length,
        itemBuilder: (context, int index) {
          PostHead post_head = widget.post_heads[index];
          return getPostHeadView(context, post_head);
        });
  }

  Widget getThumbnailView(BuildContext context, PostHead post_head) {
    var image = is_mobile
        ? AspectRatio(
            aspectRatio: 1.5,
            child: Image.asset(AssetPath.to(context, post_head.thumbnail),
                fit: BoxFit.fill),
          )
        : Image.asset(
            AssetPath.to(context, post_head.thumbnail),
            height: 160,
            width: 240,
            fit: BoxFit.fill,
          );

    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        alignment: Alignment.center,
        child: image);
  }

  Widget getInfoView(BuildContext context, PostHead post_head) {
    var content =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      getTitleView(context, post_head),
      getTagsView(context, post_head),
      getViewsView(context, post_head),
    ]);
    return is_mobile ? content : Expanded(child: content);
  }

  Widget getTitleView(BuildContext context, PostHead post_head) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 10.0),
      child: Text(
        post_head.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget getTagsView(BuildContext context, PostHead post_head) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Wrap(
          children: List<Widget>.generate(post_head.tags.length, (idx) {
        return Padding(
            padding: EdgeInsets.only(right: 10.0, bottom: 5.0),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff3BDC9A),
              ),
              child: Text(post_head.tags[idx],
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                  )),
            ));
      })),
    );
  }

  Widget getViewsView(BuildContext context, PostHead post_head) {
    var textStyle = TextStyle(
      color: Color(0xff707070),
      fontSize: 12,
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w300,
    );

    return Container(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Text("조회수 : ${post_head.views}회", style: textStyle),
          ),
          Text("|", style: textStyle),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(DateTimeConverter.convert(post_head.creation_date),
                style: textStyle),
          ),
        ]));
  }

  Widget getPostHeadView(BuildContext context, PostHead post_head) {
    var content = [
      getThumbnailView(context, post_head),
      getInfoView(context, post_head),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: item_horizontal_padding, vertical: 20.0),
      child: is_mobile ? Column(children: content) : Row(children: content),
    );
  }
}
