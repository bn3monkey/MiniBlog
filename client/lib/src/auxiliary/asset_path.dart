//import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class AssetPath {
  static String to(BuildContext context, String path) {
    if (Theme.of(context).platform == TargetPlatform.windows) {
      path = 'assets/' + path;
    }
    return path;
  }
}
