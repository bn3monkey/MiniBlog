import 'package:flutter/material.dart';
import 'package:client/src/model/section.dart';

class SectionView extends StatefulWidget {
  SectionView({Key? key, required this.height}) : super(key: key);
  final double height;
  final Section section = Section(items: ["그림", "음악", "코딩"]);

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  void select(int idx) {
    setState(() {
      widget.section.select(idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    var section = widget.section;

    return Row(
        children: List<Widget>.generate(section.length, (idx) {
      return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: TextButton(
          onPressed: () {
            select(idx);
          },
          child: Text(section[idx],
              style: TextStyle(
                color: Colors.white
                    .withOpacity(section.isSelected(idx) ? 1.0 : 0.8),
                fontSize: height,
              ),
              textAlign: TextAlign.center),
        ),
      );
    }).toList());
  }
}
