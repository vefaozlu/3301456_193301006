import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';
import 'package:pomodoro/model/models/models.dart';
import 'package:pomodoro/model/repositories/settings_repository.dart';
import 'package:pomodoro/viewmodel/viewmodel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (_) =>
          SettingsCubit(context.read<SettingsRepository>())..fetchSettings(),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final Settings settings = context.watch<SettingsCubit>().state.settings;
    final Size size = MediaQuery.of(context).size;
    int studyDuration = (settings.studyDuration / 60).floor();
    int breakDuration = (settings.breakDuration / 60).floor();
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SlidingUpPanel(
        maxHeight: size.height * .35,
        minHeight: 0,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        controller: _panelController,
        panel: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorPackage.firstGradientColor,
                ColorPackage.secondGradientColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AutoSizeText(
                'Are Sure About That?',
                minFontSize: 21,
                style:
                    TextPackage.mediumTextStyle(ColorPackage.primaryTextColor),
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 35),
                      primary: ColorPackage.primaryTextColor,
                    ),
                    child: AutoSizeText(
                      'Continue',
                      minFontSize: 21,
                      style: TextPackage.normalTextStyle(
                          ColorPackage.secondaryColor),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: AutoSizeText(
                      'Cancel',
                      minFontSize: 21,
                      style: TextPackage.normalTextStyle(
                        ColorPackage.primaryTextColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: kBottomNavigationBarHeight),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: ColorPackage.primaryTextColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: ColorPackage.secondaryColor,
                      size: 56,
                    ),
                  ),
                ),
                AutoSizeText(
                  'User',
                  minFontSize: 24,
                  style:
                      TextPackage.boldTextStyle(ColorPackage.primaryTextColor),
                ),
              ],
            ),
            SettingTile(
              icon: const Icon(
                Icons.av_timer,
                color: ColorPackage.secondaryColor,
                size: 32,
              ),
              text: 'Study Duration\n$studyDuration',
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 32,
                  ),
                  color: ColorPackage.primaryTextColor,
                  onPressed: () {
                    context.read<SettingsCubit>().updateSettings(
                        studyDuration: settings.studyDuration - 60);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    size: 32,
                  ),
                  color: ColorPackage.primaryTextColor,
                  onPressed: () {
                    context.read<SettingsCubit>().updateSettings(
                        studyDuration: settings.studyDuration + 60);
                  },
                ),
              ],
            ),
            SettingTile(
              icon: const Icon(
                Icons.av_timer,
                color: ColorPackage.secondaryColor,
                size: 32,
              ),
              text: 'Break Duration\n$breakDuration',
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 32,
                  ),
                  color: ColorPackage.primaryTextColor,
                  onPressed: () {
                    context.read<SettingsCubit>().updateSettings(
                        breakDuration: settings.breakDuration - 60);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    size: 32,
                  ),
                  color: ColorPackage.primaryTextColor,
                  onPressed: () {
                    context.read<SettingsCubit>().updateSettings(
                        breakDuration: settings.breakDuration + 60);
                  },
                ),
              ],
            ),
            SettingTile(
              icon: const Icon(
                Icons.light_mode_outlined,
                color: ColorPackage.secondaryColor,
                size: 32,
              ),
              text: 'Dark Theme',
              actions: [
                Switch(
                  activeColor: ColorPackage.primaryTextColor,
                  inactiveThumbColor: ColorPackage.secondaryColor,
                  value: settings.darkTheme,
                  onChanged: (value) {
                    context
                        .read<SettingsCubit>()
                        .updateSettings(darkTheme: value);
                  },
                ),
              ],
            ),
            SettingTile(
              icon: const Icon(
                Icons.history,
                color: ColorPackage.secondaryColor,
                size: 32,
              ),
              text: 'Clear History',
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 28),
                  color: ColorPackage.primaryTextColor,
                  onPressed: () => _panelController.open(),
                ),
              ],
            ),
            const SizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.actions,
  }) : super(key: key);
  final Icon icon;
  final String text;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: ColorPackage.primaryTextColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: icon,
              ),
              const SizedBox(width: 12),
              AutoSizeText(
                text,
                minFontSize: 18,
                textAlign: TextAlign.center,
                style: TextPackage.normalTextStyle(
                  ColorPackage.primaryTextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: actions,
          ),
        ],
      ),
    );
  }
}
