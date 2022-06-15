part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState(this.settings);
  final Settings settings;

  @override
  List<Object> get props => [settings];
}
