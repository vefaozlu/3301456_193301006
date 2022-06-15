import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';

class GoalTile extends StatefulWidget {
  const GoalTile({Key? key}) : super(key: key);

  @override
  State<GoalTile> createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .05,
        vertical: 15,
      ),
      child: Container(
        height: size.height * .1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 7,
              offset: Offset(3, 3),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorPackage.firstGradientColor,
              ColorPackage.secondGradientColor,
            ],
          ),
        ),
        child: Row(
          children: [
            CustomPaint(
              size: Size(size.height * .1 - 10, size.height * .1 - 10),
              painter: GoalPainter(),
              foregroundPainter: GoalForegroundPainter(sweepAngle: 85),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Biology',
                    minFontSize: 18,
                    style: TextPackage.boldTextStyle(
                        ColorPackage.primaryTextColor),
                  ),
                  AutoSizeText(
                    '0 pomodoros done today',
                    minFontSize: 16,
                    style: TextPackage.lightTextStyle(
                        ColorPackage.primaryTextColor),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: ColorPackage.primaryTextColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class GoalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPackage.primaryColor
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    double convert(int degree) => degree * (3.1415 / 180);

    final path = Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * .8,
            width: size.width * .8,
          ),
          convert(270),
          convert(360),
          false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant GoalPainter oldDelegate) => false;
}

class GoalForegroundPainter extends CustomPainter {
  GoalForegroundPainter({required this.sweepAngle});
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = ColorPackage.primaryTextColor
      ..strokeWidth = 7.5
      ..style = PaintingStyle.stroke;

    double convert(double degree) => degree * (3.1415 / 180);

    final path = Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * .8,
            width: size.width * .8,
          ),
          convert(270),
          convert(sweepAngle),
          false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(GoalForegroundPainter oldDelegate) =>
      oldDelegate.sweepAngle != sweepAngle;
}
