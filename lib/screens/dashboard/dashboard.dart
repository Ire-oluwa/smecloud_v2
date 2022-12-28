import 'package:flutter/material.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/history/history.dart';
import 'package:sme_cloud_version2/screens/home/home.dart';
import 'package:sme_cloud_version2/screens/more/more.dart';
import 'package:sme_cloud_version2/screens/statistics/statistics.dart';
import 'package:sme_cloud_version2/screens/utilities/nav_bar_items/nav_bar_items.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String id = "dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _screens = [
    const Home(),
    const History(),
    const Statistics(),
    const More(),
  ];

  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: showNavBarItems(),
    );
  }

  onItemTapped(selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  showNavBarItems() {
    return BottomNavigationBar(
      onTap: onItemTapped,
      items: bottomNavBarItems(),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPurpleTheme,
      currentIndex: _currentIndex,
    );
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return NavBarItem.getNavBarItem()
        .map((e) => BottomNavigationBarItem(
              icon: e.icon,
              label: e.label,
            ))
        .toList();
  }
}
