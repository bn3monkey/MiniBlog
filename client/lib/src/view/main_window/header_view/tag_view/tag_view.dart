import 'package:flutter/material.dart';

class TagView extends StatefulWidget {
  TagView({Key? key, required this.height}) : super(key: key);

  final double height;
  List<String> items = ["TAG1", "TAG2", "TAG3"];
  List<bool> is_selected = [false, false, false];

  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  void select(int idx) {
    setState(() {
      widget.is_selected[idx] = !widget.is_selected[idx];
    });
  }

  bool isSelected(int idx) {
    return widget.is_selected[idx];
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    double button_height = height * 0.7;
    double text_size = height * 0.4;
    var items = widget.items;

    return Container(
        height: height,
        alignment: Alignment.center,
        child: Row(
            children: List<Widget>.generate(items.length, (idx) {
          double opacity = isSelected(idx) ? 1.0 : 0.5;

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
              child: Text(items[idx],
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
