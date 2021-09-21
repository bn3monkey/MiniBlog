import 'package:flutter/material.dart';

import 'package:client/src/model/section.dart';
import 'package:client/src/model/tag.dart';
import 'package:flutter/services.dart';

class WriteView extends StatefulWidget {
  WriteView({Key? key}) : super(key: key);

  double width = 0.0;
  Section section = Section(items: ["음악", "그림", "코딩"]);
  Map<String, Tag> tag_map = {
    "음악": Tag(items: ["작곡", "드럼"]),
    "그림": Tag(items: ["만화", "낙서"]),
    "코딩": Tag(items: [
      "블로그 제작",
      "c++",
      "flutter",
      "wpf",
      "kotlin",
      "node.js",
      "android"
    ]),
  };

  @override
  _WriteViewState createState() => _WriteViewState();

  void resize(double width) {
    this.width = width;
  }
}

class _WriteViewState extends State<WriteView> {
  late TextEditingController tag_input;

  @override
  initState() {
    tag_input = TextEditingController();
    widget.tag_map.forEach((key, value) {
      value.unselectAll();
    });
  }

  //@ToDo Distinguish between creating a new post and editing an existing one
  Widget getThumbNailView(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: OutlinedButton(
          onPressed: () {},
          child: Text(
            "머리사진\n추가",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x80707070),
              fontSize: 12,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1, color: Color(0xff707070)))),
    );
  }

  Widget getTitleView(BuildContext context) {
    return Container(
        width: 300,
        padding: EdgeInsets.only(left: 5.0),
        child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff707070))),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
                hintText: "어그로 끌기 좋은 제목을 써보세요.")));
  }

  Widget getSectionView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 20.0),
            child: Text(
              "항목",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
              children: List<Widget>.generate(widget.section.length, (idx) {
            bool isSelected = widget.section.isSelected(idx);
            return Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    print("SECTION CLICKEd?");
                    widget.section.select(idx);
                  });
                },
                child: Text(widget.section[idx],
                    style: TextStyle(
                        color: Colors.black.withOpacity(isSelected ? 1.0 : 0.7),
                        fontSize: 14,
                        fontFamily: 'NotoSans',
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400),
                    textAlign: TextAlign.center),
              ),
            );
          }).toList())
        ],
      ),
    );
  }

  Widget getTagListView(BuildContext context, Tag? tags) {
    if (tags == null) return Container();

    print("Tag Length : ${tags.length}");
    var tagList = List<Widget>.generate(tags.length, (idx) {
      bool isSelected = tags.isSelected(idx);
      String text = tags[idx];
      return Container(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              tags.select(idx);
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor:
                tags.isSelected(idx) ? Color(0xaa3BDC9A) : Colors.transparent,
            side: BorderSide(
                width: 1.0, color: Color(0xff707070), style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Text(text,
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center),
          ),
        ),
      );
    }).toList(growable: true);

    tagList.add(getTagAdderView(context, tags));

    return Wrap(
      children: tagList,
    );
  }

  Widget getTagAdderView(BuildContext context, Tag? tags) {
    if (tags == null) return Container();
    return Container(
        width: 150,
        height: 35,
        child: TextField(
            controller: tag_input,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) async {
              setState(() {
                tag_input.clear();
                if (!tags.findAndRemove(value)) {
                  tags.add(value);
                }
              });
            },
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff707070))),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
                hintText: "태그 추가/삭제.")));
  }

  Widget getTagsView(BuildContext context) {
    var section = widget.section.selectedItem();
    print("Section : ${section}");
    var tags = widget.tag_map[section];
    if (tags != null) print("Tags : ${tags.items}");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 20.0),
            child: Text(
              "태그",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: getTagListView(context, tags)),
        ],
      ),
    );
  }

  Widget getContentView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            color: Color(0xff707070),
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(15.0),
        child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlign: TextAlign.start,
            decoration: InputDecoration.collapsed(
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
                hintText: "관심을 받기 위해 아무거나 끄적여보세요.")),
      ),
    );
  }

  Widget getConfirmView(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text("글쓰기",
            style: TextStyle(
              color: Color(0xff005555),
              fontSize: 14,
              fontFamily: 'NotoSans',
            ),
            textAlign: TextAlign.center),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getThumbNailView(context),
        getTitleView(context),
        getSectionView(context),
        getTagsView(context),
        getContentView(context),
        getConfirmView(context),
      ]),
    );
  }
}
