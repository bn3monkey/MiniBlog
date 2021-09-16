import 'package:flutter/material.dart';
import 'package:client/src/model/post_head.dart';
import 'mobile_post_view.dart';
import 'nonmobile_post_view.dart';

class PostView extends StatefulWidget {
  PostView({Key? key, required this.width}) : super(key: key);

  final double width;
  List<PostHead> post_heads = [
    PostHead(
        id: 1,
        title: "샌즈파피루스PPAP",
        section: "개발",
        tags: ["TAG1", "TAG2"],
        views: 12,
        thumbnail: "image/test/thumbnail1.png",
        creation_date: DateTime.now()),
    PostHead(
        id: 2,
        title: "귀여운 피카츄",
        section: "개발",
        tags: ["TAG1", "TAG2", "TAG3"],
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.post_heads.length,
        itemBuilder: (context, int index) {
          return getPostHead(context, index);
        });
  }

  Widget getPostHead(BuildContext context, int index) {
    PostHead post_head = widget.post_heads[index];
    var width = widget.width;

    print("width : $width");

    bool is_mobile = width < 600.0;

    return is_mobile
        ? MobilePostView(post_head: post_head, width: width).build(context)
        : NonMobilePostView(post_head: post_head).build(context);
  }
}
