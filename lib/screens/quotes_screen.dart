import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: Center(child: Text('Quotes Screen')),
    );
  }
}
