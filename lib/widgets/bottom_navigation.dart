import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/screens/discover_screen.dart';
import 'package:communioncc/screens/giving_screen.dart';
import 'package:communioncc/screens/home_screen.dart';
import 'package:communioncc/screens/location_screen.dart';
import 'package:communioncc/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    GivingScreen(),
    LocationScreen(),
    ProfileScreen()
  ];

  int _selectedindex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  void _onItemTapped(int _selectedindex) {
    _pageController.jumpToPage(_selectedindex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: Container(
        height: 64,
        decoration: BoxDecoration(
          color: mFillColour,
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.3),
              spreadRadius: 2.0,
              blurRadius: 15.0,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_fill_outlined,
                size: 24.0,
              ),
              label: 'Sermon',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account_outlined,
                size: 24.0,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard_outlined,
                size: 24.0,
              ),
              label: 'Giving',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.place_outlined,
                size: 24.0,
              ),
              label: 'Locations',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 24.0,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedindex,
          onTap: _onItemTapped,
          selectedItemColor: mOrangeColour,
          unselectedItemColor: mSubtitleColour,
          selectedFontSize: 15.0,
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
