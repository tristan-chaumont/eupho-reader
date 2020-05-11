import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eupho_reader/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eupho_reader/pages/library.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(EuphoR());
}

class EuphoR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set status bar to transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: euphoGrey['w800'],
      ),
    );
    return MaterialApp(
      title: 'Eupho: Reader',
      theme: ThemeData(
        scaffoldBackgroundColor: euphoGrey['w900'],
      ),
      home: HomePage(),
    );
  }
}

////////////// HOME PAGE //////////////
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white38);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
              tabs: [
                GButton(
                  icon: Icons.library_books,
                  text: 'Library',
                ),
                GButton(
                  icon: Icons.access_time,
                  text: 'Recents',
                ),
                GButton(
                  icon: LineIcons.cloud_download,
                  text: 'Browse',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 16,
        backgroundColor: euphoGrey['w800'],
        curve: Curves.easeInOutQuad,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
            
          });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.fastLinearToSlowEaseIn);
        },
        items: [
          _buildBottomNavyBarItem(
            icon: Icon(Icons.library_books),
            title: 'Library',
          ),
          _buildBottomNavyBarItem(
            icon: Icon(),
            title: 'Recents',
          ),
          _buildBottomNavyBarItem(
            icon: Icon(Icons.explore),
            title: 'Browse',
          ),
          _buildBottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: 'Settings',
          ),
        ],
      ),*/
