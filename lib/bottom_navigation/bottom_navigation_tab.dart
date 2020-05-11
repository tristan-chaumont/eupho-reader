import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationTab {
  final GButton bottomNavigationBarItem;
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRouteName;

  const BottomNavigationTab({
    @required this.bottomNavigationBarItem,
    @required this.navigatorKey,
    @required this.initialRouteName,
  })  : assert(bottomNavigationBarItem != null),
        assert(navigatorKey != null),
        assert(initialRouteName != null);
}
