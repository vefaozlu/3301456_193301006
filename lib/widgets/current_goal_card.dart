import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';

class CurrentGoalCard extends StatelessWidget {
  const CurrentGoalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Container(
        height: size.height * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorPackage.firstGradientColor,
              ColorPackage.secondGradientColor
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Maths',
                      minFontSize: 24,
                      style: TextPackage.boldTextStyle(
                        ColorPackage.primaryTextColor,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: ColorPackage.primaryTextColor,
                    ),
                  ],
                ),
              ),
              const Divider(color: ColorPackage.primaryTextColor),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .6,
                      height: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CustomPaint(
                          // size: Size(size.width * .6, 20),
                          painter: PomoCountPainter(),
                          foregroundPainter:
                              const PomoCountForegroundPainter(125),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      '2 of 5 pomodoros done',
                      minFontSize: 16,
                      style: TextPackage.lightTextStyle(
                          ColorPackage.primaryTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PomoCountPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPackage.secondaryColor
      ..strokeWidth = size.height
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    // canvas.drawShadow(path, Colors.black54, 150.0, false);
  }

  @override
  bool shouldRepaint(covariant PomoCountPainter oldDelegate) => false;
}

class PomoCountForegroundPainter extends CustomPainter {
  const PomoCountForegroundPainter(this.width);
  final double width;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPackage.primaryTextColor
      ..strokeWidth = size.height
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PomoCountForegroundPainter oldDelegate) =>
      oldDelegate.width != width;
}
