import 'package:flutter/material.dart';

class SectionView extends StatefulWidget {
  SectionView({Key? key, required this.height, required this.items})
      : super(key: key);
  final double height;
  final List<String> items;

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  int selected_idx = -1;

  void select(int idx) {
    setState(() {
      if (selected_idx == idx)
        selected_idx = -1;
      else
        selected_idx = idx;
    });
  }

  bool isSelected(int idx) {
    return selected_idx == idx;
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    var items = widget.items;

    return Row(
        children: List<Widget>.generate(items.length, (idx) {
      return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: TextButton(
          onPressed: () {
            select(idx);
          },
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
