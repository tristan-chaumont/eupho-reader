import 'dart:io';

import 'package:eupho_reader/bottom_navigation/bottom_navigation_tab.dart';
import 'package:eupho_reader/bottom_navigation/google_bottom_navigation_scaffold.dart';
import 'package:flutter/widgets.dart';

class AdaptiveBottomNavigationScaffold extends StatefulWidget {
  /// List of the tabs to be displayed with their respective navigator's keys.
  final List<BottomNavigationTab> navigationBarItems;

  const AdaptiveBottomNavigationScaffold({
    @required this.navigationBarItems,
    Key key,
  })  : assert(navigationBarItems != null),
        super(key: key);

  @override
  _AdaptiveBottomNavigationScaffoldState createState() =>
      _AdaptiveBottomNavigationScaffoldState();
}

class _AdaptiveBottomNavigationScaffoldState
    extends State<AdaptiveBottomNavigationScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await widget
          .navigationBarItems[_selectedIndex].navigatorKey.currentState
          .maybePop(),
      child: _buildGoogle(context),
    );
  }

  Widget _buildGoogle(BuildContext context) {
    return GoogleBottomNavigationScaffold(
      navigationBarItems: widget.navigationBarItems,
      onItemSelected: onTabSelected,
      selectedIndex: _selectedIndex,
    );
  }

  /// Called when a tab selection occurs.
  void onTabSelected(int index) {
    if (_selectedIndex == index) {
      // If the user is re-selecting the tab, the common
      // behavior is to empty the stack.
      widget.navigationBarItems[index].navigatorKey.currentState
          .popUntil((route) => route.isFirst);
    }

    // If we're running on iOS there's no need to rebuild the Widget to reflect
    // the tab change.
    if (Platform.isAndroid) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      _selectedIndex = index;
    }
  }
}
