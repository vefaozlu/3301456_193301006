import 'package:flutter/material.dart';
import 'package:pomodoro/widgets/widgets.dart';
import 'package:pomodoro/helper/color_package.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double timerBarRadius = size.width * .85;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorPackage.primaryColor,
            expandedHeight: timerBarRadius + 70,
            flexibleSpace: FlexibleSpaceBar(
              background: Timer(duration: 180, timerBarRadius: timerBarRadius),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          const SliverToBoxAdapter(
            child: CurrentGoalCard(),
          ),
          const SliverPadding(padding: EdgeInsets.all(15)),
          SliverAnimatedList(
            initialItemCount: 5,
            itemBuilder: (context, index, animation) {
              return const GoalTile();
            },
          )
        ],
      ),
    );
  }
}
