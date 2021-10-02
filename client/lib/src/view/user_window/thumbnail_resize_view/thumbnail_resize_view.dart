import 'package:client/src/widget/circle_border_button.dart';
import 'package:client/src/widget/white_border_button.dart';
import 'package:flutter/material.dart';
import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

import 'dart:io';

class ThumbnailResizeView extends StatefulWidget {
  @override
  _ThumbnailResizeViewState createState() => _ThumbnailResizeViewState();

  Uint8List? image_data = null;
}

class ThumbNailMask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black.withOpacity(0.5);

    final Path path = Path();
    path.fillType = PathFillType.evenOdd;
    path.addRRect(RRect.fromRectAndCorners(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
    ));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 80));

    canvas.drawPath(path, paint);

    {
      final paint = Paint();
      paint.color = Colors.green;

      final Path path = Path();
      path.fillType = PathFillType.evenOdd;
      path.addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 82));
      path.addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 80));

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _ThumbnailResizeViewState extends State<ThumbnailResizeView> {
  static const double thumbnail_size = 220.0;

  double magnification = 1.0;
  static const double magnification_step = 0.25;
  static const double magnification_max = 10.0;
  static const double magnification_min = 1.0;
  static const int magnification_division =
      (magnification_max - magnification_min) ~/ magnification_step;

  double position_x = 0.0;
  double position_y = 0.0;
  double position_step = 10.0;

  double start_x = 0.0;
  double end_x = 0.0;
  double start_y = 0.0;
  double end_y = 0.0;

  double original_image_width = thumbnail_size;
  double original_image_height = thumbnail_size;
  double image_width = 0.0;
  double image_height = 0.0;

  void setPosition(double new_x, double new_y) {
    setState(() {
      double current_image_width = original_image_width * magnification;
      double current_image_height = original_image_height * magnification;

      if (new_x >= 0) {
        position_x = 0;
      } else if (new_x < thumbnail_size - current_image_width) {
        position_x = thumbnail_size - current_image_width;
      } else {
        position_x = new_x;
      }

      if (new_y >= 0) {
        position_y = 0;
      } else if (new_y < thumbnail_size - current_image_height) {
        position_y = thumbnail_size - current_image_height;
      } else {
        position_y = new_y;
      }

      print("Position X : $position_x Position Y : $position_y");
    });
  }

  Widget getTitleView(BuildContext context) {
    var text = Row(children: <Widget>[
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '얼굴사진 조절',
          style: TextStyle(
              fontSize: 30, fontFamily: 'Shinb7', color: Colors.white),
        ),
      ),
      Icon(KoreaMonkey.title_icon, color: Colors.white, size: 28)
    ]);
    return Row(children: [
      Container(
          alignment: Alignment.topLeft,
          child: TextButton(onPressed: () {}, child: text)),
      Expanded(child: Container())
    ]);
  }

  Widget getThumbnailMaskView(BuildContext context, double size) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(painter: ThumbNailMask()),
    );
  }

  Widget getThumbnailGestureDetector(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        end_x = start_x = details.localPosition.dx;
        print("Start X : $start_x");
        end_y = start_y = details.localPosition.dy;
        print("Start Y : $start_y");
      },
      onPanUpdate: (details) {
        end_x = details.localPosition.dx;
        print("End X : $end_x");
        end_y = details.localPosition.dy;
        print("End Y : $end_y");

        double distance_x = (end_x - start_x) * 0.1;
        if (distance_x.abs() <= 2.0) distance_x = 0;
        var new_position_x = position_x + distance_x;

        double distance_y = (end_y - start_y) * 0.1;
        if (distance_y.abs() <= 2.0) distance_y = 0;
        var new_position_y = position_y + distance_y;

        setPosition(new_position_x, new_position_y);
      },
    );
  }

  Future<Image> _getImage() async {
    if (widget.image_data != null) {
      print("data exists");
      var decodedImage = await decodeImageFromList(widget.image_data!);
      original_image_width = decodedImage.width.toDouble();
      original_image_height = decodedImage.height.toDouble();
      print(
          "original image width : $original_image_width original image height : $original_image_height");

      if (original_image_width < thumbnail_size &&
          original_image_width <= original_image_height) {
        double ratio = original_image_height / original_image_width;
        image_width = thumbnail_size * magnification;
        image_height = thumbnail_size * ratio * magnification;
      } else if (original_image_height < thumbnail_size &&
          original_image_width >= original_image_height) {
        double ratio = original_image_width / original_image_height;
        image_height = thumbnail_size * magnification;
        image_width = thumbnail_size * ratio * magnification;
      } else {
        image_width = original_image_width * magnification;
        image_height = original_image_height * magnification;
      }
      return Image.memory(
        widget.image_data!,
        width: image_width,
        height: image_height,
        fit: BoxFit.fill,
      );
    }

    print("data doesn't exists");
    original_image_width = thumbnail_size;
    original_image_height = thumbnail_size;
    image_width = original_image_width * magnification;
    image_height = original_image_height * magnification;
    return Image.asset(
      "image/test/thumbnail1.png",
      width: image_width,
      height: image_width,
      fit: BoxFit.fill,
    );
  }

  Widget getThumbnailView(BuildContext context) {
    var futureImage = FutureBuilder<Image>(
      future: _getImage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        print("Image Waiting...");
        image_width = original_image_width * magnification;
        image_height = original_image_height * magnification;
        return Image.asset(
          "image/test/thumbnail6.png",
          width: image_width,
          height: image_width,
          fit: BoxFit.fill,
        );
      },
    );

    return Container(
        width: thumbnail_size,
        height: thumbnail_size,
        child: Stack(children: [
          Positioned(
            left: position_x,
            top: position_y,
            child: futureImage,
          ),
          getThumbnailMaskView(context, thumbnail_size),
          getThumbnailGestureDetector(context),
        ]));
  }

  Widget getSliderView(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleBorderButton(
            size: 25,
            child: Icon(KoreaMonkey.minus, color: Colors.white, size: 22),
            onPressed: () {
              setState(() {
                if (magnification > magnification_max)
                  magnification -= magnification_step;
                setPosition(position_x, position_y);
              });
            }),
        Slider(
            inactiveColor: Colors.white.withOpacity(0.5),
            activeColor: Colors.white70,
            thumbColor: Colors.white,
            value: magnification,
            min: magnification_min,
            max: magnification_max,
            divisions: magnification_division,
            label: magnification.toString(),
            onChanged: (double value) {
              setState(() {
                magnification = value;
                setPosition(position_x, position_y);
              });
            }),
        CircleBorderButton(
            size: 25,
            child: Icon(KoreaMonkey.plus, color: Colors.white, size: 22),
            onPressed: () {
              setState(() {
                if (magnification < magnification_max)
                  magnification += magnification_step;
                setPosition(position_x, position_y);
              });
            }),
      ],
    ));
  }

  Widget getFindButtonView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "찾기",
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform
              .pickFiles(allowMultiple: false, type: FileType.image);

          if (result != null) {
            print("Result is Not NULL!");

            var decoded_data = result.files.first.bytes;
            setState(() {
              widget.image_data = decoded_data;
            });
          }
        },
      ),
    );
  }

  Widget getConfirmButtonView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "확인",
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {},
      ),
    );
  }

  Widget getCancelButtonView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: WhiteBorderButton(
        data: "취소",
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        fontSize: 20.0,
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            getTitleView(context),
            Expanded(child: Container()),
            getThumbnailView(context),
            getSliderView(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFindButtonView(context),
                  getConfirmButtonView(context),
                  getCancelButtonView(context),
                ],
              ),
            )
          ],
        ));
  }
}
