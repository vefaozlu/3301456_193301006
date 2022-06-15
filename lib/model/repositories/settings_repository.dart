import 'package:hive/hive.dart';
import 'package:pomodoro/model/models/models.dart';

class SettingsRepository {
  const SettingsRepository(this.box);
  final Box<Settings> box;

  Future<Settings> fetchItem() async {
    if (box.isEmpty) {
      await box.put('settings', Settings());
    }

    return box.get('settings')!;
  }

  Future<Settings> updateSettings(Settings newSettings) async {
    await box.put('settings', newSettings);

    return box.get('settings')!;
  }
}
