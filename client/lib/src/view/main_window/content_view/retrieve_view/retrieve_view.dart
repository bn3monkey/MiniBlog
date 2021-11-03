import 'package:flutter/material.dart';

import 'package:client/src/model/post_head.dart';
import 'package:client/src/model/post.dart';
import 'package:client/src/model/user.dart';
import 'package:client/src/model/comment.dart';
import 'package:client/src/model/reply.dart';

import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'comment_view/comment_view.dart';

class RetrieveView extends StatefulWidget {
  RetrieveView({Key? key, required this.width}) : super(key: key);

  final double width;

  Post post = Post(
    head: PostHead(
        id: 1,
        title: "와! 샌즈 아시는구나! 샌즈 겁나 셉니다!",
        section: "개발",
        tags: ["샌즈", "파피루스", "피카츄라이츄", "파이리?꼬꼬꼬뿌끼", "TAG5"],
        views: 12,
        thumbnail: "image/test/thumbnail1.png",
        creation_date: DateTime.now()),
    content: '''
# 샌즈파피루스PPAP
## 샌즈
겁나 셉니다
## 파피루스
겁나 착합니다.

  언더테일 아시는구나! 혹시 모르시는분들에 대해 설명해드립니다 샌즈랑 언더테일의 세가지 엔딩루트중
몰살 엔딩의 최종보스로 진.짜.겁.나.어.렵.습.니.다 공격은 전부다 회피하고 만피가 92인데 샌즈의 공격은 1초당
60이 다는데다가 독뎀까지 추가로 붙어있습니다.. 하지만 이러면 절대로 게임을 깰 수 가없으니 제작진이 치명
적인 약점을 만들었죠. 샌즈의 치명적인 약점이 바로 지친다는것입니다. 패턴들을 다 견디고나면 지쳐서 자신의
턴을 유지한채로 잠에듭니다. 하지만 잠이들었을때 창을옮겨서 공격을 시도하고 샌즈는 1차공격은 피하지만 그
후에 바로날아오는 2차 공격을 맞고 죽습니다.
''',
    comments: [
      Comment(
          id: 1,
          user: User(id: 1, profile: "image/test/profile1.png", name: "조선킹숭이"),
          content: "우끼끼!",
          creation_date: DateTime.now(),
          replies: [
            Reply(
                id: 1,
                user: User(
                  id: 4,
                  profile: "image/test/profile4.png",
                  name: "일본갓숭이",
                ),
                creation_date: DateTime.now(),
                content: "좌끼끼"),
            Reply(
                id: 2,
                user: User(
                  id: 5,
                  profile: "image/test/profile5.png",
                  name: "엠퍼러원숭이",
                ),
                creation_date: DateTime.now(),
                content: "상끼끼"),
          ]),
      Comment(
          id: 2,
          user: User(id: 2, profile: "image/test/profile2.png", name: "와샌즈"),
          content: "Do you wanna have a bad time?",
          creation_date: DateTime.now(),
          replies: []),
      Comment(
          id: 3,
          user: User(id: 3, profile: "image/test/profile3.png", name: "와파피루스"),
          content: '''
좀 기다란 댓글을 위해서
테스트용으로 하튼
어쩌구저쩌구 말 많이 해서
세계정복하고 싶다.
''',
          creation_date: DateTime.now(),
          replies: []),
    ],
  );

  @override
  _RetrieveViewState createState() => _RetrieveViewState();
}

class _RetrieveViewState extends State<RetrieveView> {
  late Post post;
  late bool is_mobile = false;

  @override
  initState() {
    post = widget.post;
  }

  Widget getThumbnailView(BuildContext context) {
    var thumbnail = post.head.thumbnail;

    return Container(
      padding: EdgeInsets.only(left: 20.0),
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
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700,
          ),
        ));
  }

  Widget getTagView(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Wrap(
          children: List<Widget>.generate(post.head.tags.length, (idx) {
        return Padding(
            padding: EdgeInsets.only(right: 5.0, bottom: 5.0),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 1.0, bottom: 1.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff3BDC9A),
              ),
              child: Text(post.head.tags[idx],
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w300,
                  )),
            ));
      })),
    );
  }

  Widget getViewsView(BuildContext context) {
    var views = post.head.views;
    var creation_date = post.head.creation_date;

    var textStyle = TextStyle(
      color: Color(0xff707070),
      fontSize: 15,
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w300,
    );

    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 20.0),
      child: Row(children: [
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Text("조회수 : ${views}회", style: textStyle),
        ),
        Text("|", style: textStyle),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child:
              Text(DateTimeConverter.convert(creation_date), style: textStyle),
        ),
      ]),
    );
  }

  Widget getInfoView(BuildContext context) {
    return Column(children: [
      getTitleView(context),
      getTagView(context),
      getViewsView(context),
    ]);
  }

  Widget getSuperUserView(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(
              0,
              3,
            ))
      ]),
      child: is_mobile
          ? Column(
              children: [
                getInfoView(context),
                getSuperUserView(context),
              ],
            )
          : Row(
              children: [
                getThumbnailView(context),
                Expanded(
                  child: getInfoView(context),
                ),
                getSuperUserView(context),
              ],
            ),
    );
  }

  Widget getContentView(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: MarkdownBody(data: post.content));
  }

  Widget getCommentView(BuildContext context) {
    return CommentView(comments: post.comments);
  }

  @override
  Widget build(BuildContext context) {
    is_mobile = widget.width < 600.0;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(children: [
        getHeaderView(context),
        getContentView(context),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        getCommentView(context),
      ]),
    );
  }
}
