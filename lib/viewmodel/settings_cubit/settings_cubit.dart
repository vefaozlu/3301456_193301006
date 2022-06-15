import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodoro/model/models/models.dart';
import 'package:pomodoro/model/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository;
  SettingsCubit(SettingsRepository repository)
      : _repository = repository,
        super(SettingsState(Settings()));

  Future<void> fetchSettings() async {
    final Settings settings;

    settings = await _repository.fetchItem();

    emit(SettingsState(settings));
  }

  Future<void> updateSettings({
    int? studyDuration,
    int? breakDuration,
    bool? darkTheme,
  }) async {
    final Settings settings;
    final Settings newSettings;

    settings = state.settings;

    newSettings = await _repository.updateSettings(
      settings.copyWith(
        studyDuration: studyDuration,
        breakDuration: breakDuration,
        darkTheme: darkTheme,
      ),
    );

    emit(SettingsState(newSettings));
  }
}
