import 'package:flutter/material.dart';
import 'mobile_retrieve_view.dart';
import 'nonmobile_retrieve_view.dart';

import 'package:client/src/model/post_head.dart';
import 'package:client/src/model/post.dart';
import 'package:client/src/model/user.dart';
import 'package:client/src/model/comment.dart';
import 'package:client/src/model/reply.dart';

class RetrieveView extends StatefulWidget {
  RetrieveView({Key? key, required this.width}) : super(key: key);
  final double width;

  Post post = Post(
    head: PostHead(
        id: 1,
        title: "샌즈파피루스PPAP",
        section: "개발",
        tags: ["TAG1", "TAG2"],
        views: 12,
        thumbnail: "image/test/thumbnail1.png",
        creation_date: DateTime.now()),
    content: '''
# 샌즈파피루스PPAP
## 샌즈
겁나 셉니다
## 파피루스
겁나 착합니다.

스크롤 수를 늘리기 위해
아무렇게나 뭐라도 씁니다.

샌즈
파피루스
PPAP
샌즈 파피루스
PPAP

*샌즈 파피루스 PPAP*
**샌즈 파피루스 PPAP*

```cpp
int main()
{
  printf("FUCKING");
  return 0;
}
```

Do you know Kimchi?
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
          content: "Do you wanna have a good time?",
          creation_date: DateTime.now(),
          replies: []),
    ],
  );

  @override
  _RetrieveViewState createState() => _RetrieveViewState();
}

class _RetrieveViewState extends State<RetrieveView> {
  @override
  Widget build(BuildContext context) {
    Post post = widget.post;
    var width = widget.width;

    print("width : $width");

    bool is_mobile = width < 600.0;

    return is_mobile
        ? MobileRetrieveView(post: post)
        : NonMobileRetrieveView(post: post);
  }
}
