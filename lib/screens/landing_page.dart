import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/screens/screens.dart';
import 'package:pomodoro/widgets/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PanelController _panelController = PanelController();
  bool bottomNavBarExpanded = true;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'history':
        return MaterialPageRoute(builder: (context) => const HistoryScreen());
      case 'quotes':
        return MaterialPageRoute(builder: (context) => const QuotesScreen());
      case 'settings':
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const MainScreen());
    }
  }

  void openPanel() => _panelController.open();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: _onGenerateRoute,
        ),
        panel: const AddGoalPanel(),
        color: ColorPackage.primaryColor,
        controller: _panelController,
        onPanelOpened: () async {
          Future.delayed(const Duration(milliseconds: 250));
          setState(() => bottomNavBarExpanded = false);
        },
        onPanelClosed: () => setState(() => bottomNavBarExpanded = true),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        maxHeight: size.height * .9,
        minHeight: 0,
      ),
      bottomNavigationBar: BottomNavBar(
        expanded: bottomNavBarExpanded,
        openPanel: openPanel,
        navigatorKey: _navigatorKey,
      ),
    );
  }
}
