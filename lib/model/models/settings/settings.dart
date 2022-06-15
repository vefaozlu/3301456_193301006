import 'package:hive_flutter/adapters.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  int studyDuration;

  @HiveField(1)
  int breakDuration;

  @HiveField(2)
  bool darkTheme;

  Settings({
    this.studyDuration = 1500,
    this.breakDuration = 300,
    this.darkTheme = true,
  });

  Settings copyWith({int? studyDuration, int? breakDuration, bool? darkTheme}) {
    return Settings(
      studyDuration: studyDuration ?? this.studyDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}
