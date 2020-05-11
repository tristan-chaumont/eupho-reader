import 'package:eupho_reader/bottom_navigation/adaptive_bottom_navigation_scaffold.dart';
import 'package:eupho_reader/bottom_navigation/bottom_navigation_tab.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationTab> _bottomNavigationTabs = [
    BottomNavigationTab(
      bottomNavigationBarItem: GButton(
        text: 'Library',
        icon: Icons.library_books,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: 'library',
    ),
    BottomNavigationTab(
      bottomNavigationBarItem: GButton(
        text: 'Recents',
        icon: Icons.access_time,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: 'recents',
    ),
    BottomNavigationTab(
      bottomNavigationBarItem: GButton(
        text: 'Browse',
        icon: LineIcons.cloud_download,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: 'browse',
    ),
    BottomNavigationTab(
      bottomNavigationBarItem: GButton(
        text: 'Settings',
        icon: Icons.settings,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: 'settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveBottomNavigationScaffold(
      navigationBarItems: _bottomNavigationTabs,
    );
  }
}
