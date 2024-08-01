import 'package:ecosense/src/screens/home/bottom_nav/home_nav_view.dart';
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
    const Icon(
      Icons.book,
      color: Colors.white,
    ),
    const Icon(
      Icons.home,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
    )
  ];

  List<Widget> navScreens = [
    const HomeNavView(),
    const HomeNavView(),
    const HomeNavView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: navScreens[value],
          bottomNavigationBar: NavigationBar(
            selectedIndex: value,
            backgroundColor: AppTheme.primaryColor,
            height: 54,
            onDestinationSelected: onDestinationSelected,
            destinations: navDestinations,
          )),
    );
  }

  onDestinationSelected(int index) {
    setState(() {
      value = index;
    });
  }
}
