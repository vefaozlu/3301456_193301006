import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';

class GoalLineChart extends StatefulWidget {
  const GoalLineChart({Key? key}) : super(key: key);

  @override
  State<GoalLineChart> createState() => GoalLineChartState();
}

class GoalLineChartState extends State<GoalLineChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: LineChart(
        LineChartData(
          maxX: 6,
          maxY: 10,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(color: ColorPackage.primaryTextColor),
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Mon',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                    case 1:
                      return Text(
                        'Tue',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                    case 2:
                      return Text(
                        'Wed',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                    case 3:
                      return Text(
                        'Thu',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                    case 4:
                      return Text(
                        'Fri',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                    case 5:
                      return Text(
                        'Sat',
                        style: TextPackage.lightTextStyle(
                            ColorPackage.primaryTextColor),
                      );
                  }
                  return Text(
                    'Sun',
                    style: TextPackage.lightTextStyle(
                        ColorPackage.primaryTextColor),
                  );
                },
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              shadow: const BoxShadow(
                  color: Colors.black54, blurRadius: 7, offset: Offset(2, 2)),
              show: true,
              color: ColorPackage.primaryTextColor,
              isCurved: true,
              barWidth: 5,
              spots: data(items, -1),
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorPackage.firstGradientColor,
                    ColorPackage.secondGradientColor
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<int> items = [4, 2, 3, 5, 3, 4, 1];
  List<FlSpot> data(List<int> items, int touchedIndex) {
    return List.generate(
        7, (index) => FlSpot(index.toDouble(), items[index].toDouble()));
  }
}
