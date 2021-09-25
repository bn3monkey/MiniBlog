import 'package:client/src/widget/circle_border_button.dart';
import 'package:client/src/widget/white_border_button.dart';
import 'package:flutter/material.dart';
import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/icon/korea_monkey_icons.dart';

class ThumbnailResizeView extends StatefulWidget {
  @override
  _ThumbnailResizeViewState createState() => _ThumbnailResizeViewState();

  Image image = Image(image: AssetImage("image/test/thumbnail2.png"));
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _ThumbnailResizeViewState extends State<ThumbnailResizeView> {
  double magnification = 1.0;
  static const double magnification_step = 0.25;
  static const double magnification_max = 10.0;
  static const double magnification_min = 0.25;
  static const int magnification_division =
      (magnification_max - magnification_min) ~/ magnification_step;

  double position_x = 0.0;
  double position_y = 0.0;
  double position_step = 10.0;

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

  Widget getThumbnailView(BuildContext context) {
    var image = widget.image;
    print(image);
    double size = 220.0;

    print(image.width);
    double image_width = image.width == null ? size : widget.image.width!;
    print(image.height);
    double image_height = image.height == null ? size : widget.image.height!;

    double resized_width = image_width * magnification;
    double resized_height = image_height * magnification;

    var resized_image = ResizeImage(
      widget.image.image,
      width: resized_width.toInt(),
      height: resized_height.toInt(),
    );

    return Container(
        width: size,
        height: size,
        child: Stack(children: [
          Positioned(
            right: position_x,
            bottom: position_y,
            child: Image(image: resized_image),
          ),
          getThumbnailMaskView(context, size),
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
              });
            }),
        CircleBorderButton(
            size: 25,
            child: Icon(KoreaMonkey.plus, color: Colors.white, size: 22),
            onPressed: () {
              setState(() {
                if (magnification < magnification_max)
                  magnification += magnification_step;
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
        onPressed: () {},
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
