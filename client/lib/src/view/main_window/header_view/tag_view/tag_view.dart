import 'package:flutter/material.dart';
import 'package:client/src/model/tag.dart';

class TagView extends StatefulWidget {
  TagView({Key? key, required this.height}) : super(key: key);

  final double height;
  final Tag tag = Tag(items: ["TAG1", "TAG2", "TAG3", "TAG4"]);

  late double button_height = height * 0.7;
  late double text_size = height * 0.4;

  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  void select(int idx) {
    setState(() {
      widget.tag.select(idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    double button_height = height * 0.7;
    var tag = widget.tag;

    return Container(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tag.length,
          itemBuilder: (context, int index) {
            bool isSelected = tag.isSelected(index);
            String text = tag[index];

            return Container(
              height: button_height,
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: OutlinedButton(
                onPressed: () {
                  select(index);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      isSelected ? Color(0xaa3BDC9A) : Colors.transparent,
                  side: BorderSide(
                      width: 1.0,
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(text,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        fontSize: 15,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            );
          }),
    );
  }
}
