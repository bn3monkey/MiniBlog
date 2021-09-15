import 'package:flutter/material.dart';
import 'package:client/src/model/tag.dart';

class TagView extends StatefulWidget {
  TagView({Key? key, required this.height}) : super(key: key);

  final double height;
  final Tag tag = Tag(items: ["TAG1", "TAG2", "TAG3", "TAG4"]);

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
    double text_size = height * 0.4;
    var tag = widget.tag;

    return Container(
        height: height,
        alignment: Alignment.center,
        child: Row(
            children: List<Widget>.generate(tag.length, (idx) {
          double opacity = tag.isSelected(idx) ? 1.0 : 0.5;

          return Container(
            height: button_height,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: OutlinedButton(
              onPressed: () {
                select(idx);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.withOpacity(opacity)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white.withOpacity(opacity)),
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: Text(tag[idx],
                  style: TextStyle(
                    color: Colors.white.withOpacity(opacity),
                    fontSize: text_size,
                  ),
                  textAlign: TextAlign.center),
            ),
          );
        }).toList()));
  }
}
