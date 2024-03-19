import 'package:coursefirebase_app/screens/redirectSkip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/messages.dart';
import '../screens/schedule.dart';
import '../screens/settings.dart';
import '../screens/settingsUser.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //Home Screen
    HomeScreen(),
    MessagesPage(),
    SchedulePage(),
   SettingsPageUser(),

    //Messages Screen
    Container(),
    //Schedule Screen
    Container(),
    //Settings Screen
    //SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue, // Couleur de fond en bleu
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white, // Couleur des éléments sélectionnés en blanc
          unselectedItemColor: Colors.white.withOpacity(0.6), // Couleur des éléments non sélectionnés avec une opacité de 0.6
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "Messages",
            ),
           BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}