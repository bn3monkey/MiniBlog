import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThumbnailEditor {
  ThumbnailEditor({required this.size});
  final double size;
  Function()? notifyUI = null;

  void initialize(Function() notifyUI) async {
    this.notifyUI = notifyUI;

    var byte_data = await rootBundle.load("image/test/profile1.png");
    await _initializeImage(byte_data.buffer.asUint8List());

    print("Thumbnail Editor is initialized");
    notifyUI();
  }

  Uint8List? _data = null;
  Uint8List get data => _data!;

  // MAGNIFCATION
  static const double _magnification_step = 0.25;
  static const double _magnification_max = 10.0;
  static const double _magnification_min = 1.0;
  static const int _magnification_division =
      (_magnification_max - _magnification_min) ~/ _magnification_step;

  double _magnification = 1.0;

  double get magnification => _magnification;
  double get magnification_max => _magnification_max;
  double get magnification_min => _magnification_min;
  int get magnification_division => _magnification_division;

  // Image Size
  double real_width = 0.0;
  double real_height = 0.0;
  bool is_width_short = true;
  double real_long = 0.0;
  double real_short = 0.0;

  double _width = 0.0;
  double _height = 0.0;

  double get width => _width;
  double get height => _height;

  // POSITION
  double _x = 0.0;
  double _y = 0.0;
  double get x => _x;
  double get y => _y;
  static const double sensitivity = 1.0;

  void _resize() {
    double ratio = real_long / real_short;
    double short = size * _magnification;
    double long = size * ratio * _magnification;
    print("real_long : $real_long real_short : $real_short");
    print("ratio : $ratio short : $short long : $long");

    if (is_width_short) {
      _width = short;
      _height = long;
    } else {
      _width = long;
      _height = short;
    }

    _x = _x.clamp(size - _width, 0);
    _y = _y.clamp(size - _height, 0);

    print("magnification : $_magnification widht : $_width height : $_height");
  }

  void setPosition(double dx, double dy) async {
    print("dx : $dx dy : $dy");

    dx *= sensitivity;
    dy *= sensitivity;

    double temp_x = _x + dx;
    double temp_y = _y + dy;

    _x = temp_x.clamp(size - _width, 0);
    _y = temp_y.clamp(size - _height, 0);

    if (notifyUI != null) notifyUI!();
  }

  void upMagnification() {
    if (_magnification < _magnification_max) {
      changeMagnification(_magnification + _magnification_step);
    } else {
      changeMagnification(_magnification_max);
    }
  }

  void downMagnification() {
    if (_magnification > _magnification_min) {
      changeMagnification(_magnification - _magnification_step);
    } else {
      changeMagnification(_magnification_min);
    }
  }

  void changeMagnification(double value) async {
    _magnification = value;
    _resize();

    if (notifyUI != null) notifyUI!();
  }

  Future<void> _initializeImage(Uint8List bytes) async {
    _data = bytes;
    var decodedImage = await decodeImageFromList(_data!);
    real_width = decodedImage.width.toDouble();
    real_height = decodedImage.height.toDouble();
    if (real_width > real_height) {
      real_long = real_width;
      real_short = real_height;
      is_width_short = false;
    } else {
      real_short = real_width;
      real_long = real_height;
      is_width_short = true;
    }

    double real_magnification = real_short / size;
    real_magnification =
        real_magnification.clamp(_magnification_min, _magnification_max);
    int real_division = (real_magnification ~/ _magnification_step);
    _magnification = real_division * _magnification_step;

    _x = 0.0;
    _y = 0.0;

    print("real image (width : $real_width height : $real_height)");
    _resize();
  }

  Future<void> find() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      print("thumbnail file exists");
      var bytes = result.files.first.bytes;
      if (bytes != null) {
        await _initializeImage(bytes);
        if (notifyUI != null) notifyUI!();
      }
    }
  }
}
