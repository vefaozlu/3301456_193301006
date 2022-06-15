import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key, required this.duration, required this.timerBarRadius})
      : super(key: key);
  final int duration;
  final double timerBarRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: timerBarRadius,
          child: CustomPaint(
            size: Size(timerBarRadius, timerBarRadius),
            painter: TimerPainter(),
            foregroundPainter: TimerForegroundPainter(sweepAngle: 147),
            child: Center(
              child: AutoSizeText(
                '25:00',
                minFontSize: 36,
                style:
                    TextPackage.normalTextStyle(ColorPackage.primaryTextColor),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 42),
                    color: ColorPackage.primaryTextColor,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow, size: 42),
                    color: ColorPackage.primaryTextColor,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, size: 42),
                    color: ColorPackage.primaryTextColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPackage.secondaryColor
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    double convert(int degree) => degree * (3.1415 / 180);

    final path = Path()
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          height: size.height * .9,
          width: size.height * .9,
        ),
        convert(270),
        convert(360),
        false,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TimerPainter oldDelegate) => false;
}

class TimerForegroundPainter extends CustomPainter {
  TimerForegroundPainter({required this.sweepAngle});
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = ColorPackage.primaryTextColor
      ..strokeWidth = 15.5
      ..style = PaintingStyle.stroke;

    double convert(double degree) => degree * (3.1415 / 180);

    final path = Path()
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          height: size.height * .9,
          width: size.height * .9,
        ),
        convert(270),
        convert(sweepAngle),
        false,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TimerForegroundPainter oldDelegate) =>
      oldDelegate.sweepAngle != sweepAngle;
}
