import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro/app.dart';
import 'package:pomodoro/model/models/models.dart';
import 'package:pomodoro/model/repositories/settings_repository.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Settings>(SettingsAdapter());
  final Box<Settings> box = await Hive.openBox('settingsBox');
  final SettingsRepository repository = SettingsRepository(box);

  runApp(PomodoroApp(repository: repository));
}
