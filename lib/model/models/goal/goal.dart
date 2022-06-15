class Goal {
  const Goal({
    required this.name,
    required this.estPomodoros,
    this.pomodorosDone = const [0, 0, 0, 0, 0, 0, 0],
  });

  final String name;
  final int estPomodoros;
  final List<int> pomodorosDone;

  Goal copyWith(String? name, int? estPomodoros, List<int>? pomodorosDone) {
    return Goal(
      name: name ?? this.name,
      estPomodoros: estPomodoros ?? this.estPomodoros,
      pomodorosDone: pomodorosDone ?? this.pomodorosDone,
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      name: json['name'],
      estPomodoros: json['estPomodoros'],
      pomodorosDone: json['pomodorosDone'],
    );
  }
}
