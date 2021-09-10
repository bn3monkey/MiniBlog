import 'package:flutter/material.dart';

class TagView extends StatefulWidget {
  TagView({Key? key, required this.height, required this.items})
      : super(key: key) {
    is_selected = List<bool>.generate(items.length, (idx) {
      return false;
    });
  }
  final double height;
  final List<String> items;
  late List<bool> is_selected;

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
    var items = widget.items;

    return Row(
        children: List<Widget>.generate(items.length, (idx) {
      return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: OutlinedButton(
          onPressed: () {
            select(idx);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green.withOpacity(isSelected(idx) ? 1.0 : 0.8)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.white.withOpacity(isSelected(idx) ? 1.0 : 0.8)),
              borderRadius: BorderRadius.circular(5),
            )),
          ),
          child: Text(items[idx],
              style: TextStyle(
                color: Colors.white.withOpacity(isSelected(idx) ? 1.0 : 0.8),
                fontSize: height,
              ),
              textAlign: TextAlign.center),
        ),
      );
    }).toList());
  }
}
