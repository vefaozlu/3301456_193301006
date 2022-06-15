import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          LineChartView(),
          PieChartView(),
        ],
      ),
    );
  }
}

class LineChartView extends StatefulWidget {
  const LineChartView({Key? key}) : super(key: key);

  @override
  State<LineChartView> createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .5,
          width: size.width,
          child: const GoalLineChart(),
        ),
      ],
    );
  }
}

class PieChartView extends StatefulWidget {
  const PieChartView({Key? key}) : super(key: key);

  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int touchedIndex = -1;
    return Column(
      children: [
        SizedBox(
          height: size.height * .5,
          width: size.width,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    setState(() => touchedIndex = -1);
                  } else {
                    setState(() => touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex);
                  }
                },
              ),
              sections: sections(touchedIndex, items),
              borderData: FlBorderData(show: false),
              sectionsSpace: 5,
              centerSpaceRadius: 45,
            ),
          ),
        ),
      ],
    );
  }

  List<DailyHistory> items = const [
    DailyHistory('Maths', 5),
    DailyHistory('Chem', 3),
    DailyHistory('Biology', 8),
    DailyHistory('Physics', 4),
  ];

  List<PieChartSectionData> sections(
      int touchedIndex, List<DailyHistory> items) {
    final Size size = MediaQuery.of(context).size;
    double radius = size.width * .3;
    return List.generate(
      items.length,
      (index) {
        final String selectedTitle =
            '${items[index].name}\n${items[index].done} done';
        return PieChartSectionData(
          color: ColorPackage.secondaryColor,
          value: items[index].done.toDouble(),
          title: touchedIndex == index ? selectedTitle : items[index].name,
          titleStyle: const TextStyle(
            color: ColorPackage.primaryTextColor,
            fontSize: 16,
          ),
          radius: touchedIndex == index ? radius * 1.2 : radius,
        );
      },
    );
  }
}

class DailyHistory {
  const DailyHistory(this.name, this.done);
  final String name;
  final int done;
}
