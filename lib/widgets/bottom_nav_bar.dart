import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {Key? key,
      required this.expanded,
      required this.openPanel,
      required this.navigatorKey})
      : super(key: key);
  final bool expanded;
  final VoidCallback openPanel;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  void _onTap(index) {
    if (index == 2) {
      widget.openPanel();
    } else {
      setState(() => currentIndex = index);
      switch (index) {
        case 0:
          widget.navigatorKey.currentState!.pushReplacementNamed('main');
          break;
        case 1:
          widget.navigatorKey.currentState!.pushReplacementNamed('history');
          break;
        case 3:
          widget.navigatorKey.currentState!.pushReplacementNamed('quotes');
          break;
        case 4:
          widget.navigatorKey.currentState!.pushReplacementNamed('settings');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: widget.expanded ? kBottomNavigationBarHeight : 0,
      child: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorPackage.primaryColor,
            unselectedItemColor: ColorPackage.primaryColor,
            currentIndex: currentIndex,
            onTap: _onTap,
            items: const [
              BottomNavigationBarItem(
                label: 'Main',
                icon: Icon(Icons.home),
                tooltip: '',
              ),
              BottomNavigationBarItem(
                label: 'History',
                icon: Icon(Icons.history),
                tooltip: '',
              ),
              BottomNavigationBarItem(
                label: 'New Goal',
                icon: Icon(Icons.add_circle_outline_outlined),
                tooltip: '',
              ),
              BottomNavigationBarItem(
                label: 'Quotes',
                icon: Icon(Icons.format_quote),
                tooltip: '',
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
                tooltip: '',
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: currentIndex * (size.width / 5),
            bottom: 0,
            child: Container(
              height: 5,
              width: size.width * .2,
              color: ColorPackage.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
