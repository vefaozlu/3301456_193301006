import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/model/repositories/settings_repository.dart';
import 'package:pomodoro/screens/screens.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({Key? key, required this.repository}) : super(key: key);
  final SettingsRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MultiRepositoryProvider(
          providers: [RepositoryProvider.value(value: repository)],
          child: const LandingPage(),
        ),
        // child: GoalInfoScreen(),
      ),
    );
  }
}
