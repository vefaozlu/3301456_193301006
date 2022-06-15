import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';
import 'package:pomodoro/widgets/widgets.dart';

class GoalInfoScreen extends StatefulWidget {
  const GoalInfoScreen({Key? key}) : super(key: key);

  @override
  State<GoalInfoScreen> createState() => _GoalInfoScreenState();
}

class _GoalInfoScreenState extends State<GoalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorPackage.secondaryColor,
            expandedHeight: size.height * .5,
            title: AutoSizeText(
              'Maths',
              minFontSize: 28,
              style: TextPackage.boldTextStyle(ColorPackage.primaryTextColor),
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: GoalLineChart(),
            ),
          ),
          SliverToBoxAdapter(
            child: AutoSizeText(
              'Daily Pomodoros: 5',
              minFontSize: 24,
              style: TextPackage.normalTextStyle(ColorPackage.primaryTextColor),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPackage.secondaryColor,
        child: const Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }
}
