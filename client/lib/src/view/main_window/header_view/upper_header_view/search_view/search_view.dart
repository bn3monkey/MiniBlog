import 'package:flutter/material.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';
import 'package:client/src/widget/circle_border_button.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final search_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = widget.width;
    double height = widget.height;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(height / 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 3.0, right: 10.0),
                child: CircleBorderButton(
                    onPressed: () {},
                    size: height * 0.8,
                    child: Icon(KoreaMonkey.search,
                        color: Colors.white, size: 0.7 * height))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: height / 2),
                child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height / 2,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                    controller: search_text,
                    decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: height / 2,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w300,
                        ),
                        hintText: "검색어를 입력하세요.")),
              ),
            ),
            IconButton(
                padding: EdgeInsets.only(bottom: 4.0),
                iconSize: 30.0,
                icon: Icon(KoreaMonkey.cancel, color: Colors.white),
                onPressed: () {
                  search_text.clear();
                }),
          ],
        ));
  }
}
