import 'package:flutter/material.dart';
import '../main_window_name.dart';
import 'tag_view/tag_view.dart';
import 'upper_header_view/upper_header_view.dart';

class HeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const banner = AssetImage('assets/image/banner.png')
    return Container(
        decoration:
            const BoxDecoration(image: 
              DecorationImage(image: banner, fit : BoxFit.cover,),
            ),
    );
  }
}
