import 'package:ecosense/src/screens/home/bottom_nav/actions_nav_view.dart';
import 'package:ecosense/src/screens/home/bottom_nav/home_nav_view.dart';
import 'package:ecosense/src/screens/home/bottom_nav/more_nav_view.dart';
import 'package:ecosense/theme.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int value = 1;

  List<Widget> navDestinations = [
    const NavigationDestination(
      icon: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      label: "Actions",
    ),
    const NavigationDestination(
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
      label: "Home",
    ),
    const NavigationDestination(
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      label: "Info",
    )
  ];

  List<Widget> navScreens = [
    const ActionsNavView(),
    const HomeNavView(),
    const MoreNavView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: navScreens[value],
          bottomNavigationBar: NavigationBar(
            selectedIndex: value,
            backgroundColor: AppTheme.primaryColor,
            indicatorColor: AppTheme.secondaryColor,
            onDestinationSelected: (int index) {
              setState(() {
                value = index;
              });
            },
            destinations: navDestinations,
          )),
    );
  }
}
