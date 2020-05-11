import 'package:eupho_reader/bottom_navigation/bottom_navigation_tab.dart';
import 'package:eupho_reader/router.dart';
import 'package:eupho_reader/utilities/constants.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Scaffold with a configured BottomNavigationBar, separate
/// Navigators for each tab view and state retaining across tab switches.
class GoogleBottomNavigationScaffold extends StatefulWidget {
  /// List of the tabs to be displayed with their respective navigator's keys.
  final List<BottomNavigationTab> navigationBarItems;

  /// Called when a tab selection occurs.
  final ValueChanged<int> onItemSelected;

  final int selectedIndex;

  const GoogleBottomNavigationScaffold({
    @required this.navigationBarItems,
    @required this.onItemSelected,
    @required this.selectedIndex,
    Key key,
  })  : assert(navigationBarItems != null),
        assert(onItemSelected != null),
        assert(selectedIndex != null),
        super(key: key);

  @override
  _GoogleBottomNavigationScaffoldState createState() =>
      _GoogleBottomNavigationScaffoldState();
}

class _GoogleBottomNavigationScaffoldState
    extends State<GoogleBottomNavigationScaffold>
    with TickerProviderStateMixin<GoogleBottomNavigationScaffold> {
  final List<_GoogleBottomNavigationTab> googleNavigationBarItems = [];
  final List<AnimationController> _animationControllers = [];

  /// Controls which tabs should have its content built.
  /// This enables us to lazy instantiate it.
  final List<bool> _shouldBuildTab = <bool>[];

  @override
  void initState() {
    _initAnimationControllers();
    _initGoogleNavigationBarItems();

    _shouldBuildTab.addAll(List<bool>.filled(
      widget.navigationBarItems.length,
      false,
    ));
    super.initState();
  }

  void _initGoogleNavigationBarItems() {
    googleNavigationBarItems.addAll(
      widget.navigationBarItems
          .map(
            (barItem) => _GoogleBottomNavigationTab(
              bottomNavigationBarItem: barItem.bottomNavigationBarItem,
              navigatorKey: barItem.navigatorKey,
              subtreeKey: GlobalKey(),
              initialRouteName: barItem.initialRouteName,
            ),
          )
          .toList(),
    );
  }

  void _initAnimationControllers() {
    _animationControllers.addAll(
      widget.navigationBarItems.map<AnimationController>(
        (destination) => AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );

    if (_animationControllers.isNotEmpty) {
      _animationControllers[0].value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationControllers.forEach(
      (controller) => controller.dispose(),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The Stack is what allows us to retain state across tab
      // switches by keeping all of our views in the widget tree.
      body: Stack(
        fit: StackFit.expand,
        children: googleNavigationBarItems
            .map(
              (barItem) => _buildPageFlow(
                context,
                googleNavigationBarItems.indexOf(barItem),
                barItem,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: euphoGrey['w800'], boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: euphoBlue,
              color: Colors.white38,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: euphoBlue.withOpacity(0.2),
              tabs: googleNavigationBarItems
                  .map(
                    (item) => item.bottomNavigationBarItem,
                  )
                  .toList(),
              selectedIndex: widget.selectedIndex,
              onTabChange: widget.onItemSelected,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageFlow(
    BuildContext context,
    int tabIndex,
    _GoogleBottomNavigationTab item,
  ) {
    final isCurrentlySelected = tabIndex == widget.selectedIndex;

    // We should build the tab content only if it was already built or
    // if it is currently selected.
    _shouldBuildTab[tabIndex] =
        isCurrentlySelected || _shouldBuildTab[tabIndex];

    final Widget view = FadeTransition(
      opacity: _animationControllers[tabIndex].drive(
        CurveTween(curve: Curves.fastOutSlowIn),
      ),
      child: KeyedSubtree(
        key: item.subtreeKey,
        child: _shouldBuildTab[tabIndex]
            ? Navigator(
                // The key enables us to access the Navigator's state inside the
                // onWillPop callback and for emptying its stack when a tab is
                // re-selected. That is why a GlobalKey is needed instead of
                // a simpler ValueKey.
                key: item.navigatorKey,
                initialRoute: item.initialRouteName,
                // RouteFactory is nothing but an alias of a function that takes
                // in a RouteSettings and returns a Route<dynamic>, which is
                // the type of the onGenerateRoute parameter.
                // We registered one of these in our main.dart file.
                onGenerateRoute: FluroRouter.router.generator,
              )
            : Container(),
      ),
    );

    if (tabIndex == widget.selectedIndex) {
      _animationControllers[tabIndex].forward();
      return view;
    } else {
      _animationControllers[tabIndex].reverse();
      if (_animationControllers[tabIndex].isAnimating) {
        return IgnorePointer(child: view);
      }
      return Offstage(child: view);
    }
  }
}

/// Extension class of BottomNavigationTab that adds another GlobalKey to it
/// in order to use it within the KeyedSubtree widget.
class _GoogleBottomNavigationTab extends BottomNavigationTab {
  const _GoogleBottomNavigationTab({
    @required GButton bottomNavigationBarItem,
    @required GlobalKey<NavigatorState> navigatorKey,
    @required String initialRouteName,
    @required this.subtreeKey,
  })  : assert(bottomNavigationBarItem != null),
        assert(subtreeKey != null),
        assert(initialRouteName != null),
        assert(navigatorKey != null),
        super(
          bottomNavigationBarItem: bottomNavigationBarItem,
          navigatorKey: navigatorKey,
          initialRouteName: initialRouteName,
        );

  final GlobalKey subtreeKey;
}
