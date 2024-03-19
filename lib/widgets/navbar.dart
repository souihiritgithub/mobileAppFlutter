import 'package:coursefirebase_app/screens/redirectSkip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/home_screen_skip.dart';
import '../screens/settings.dart';

class NavBarRootskip extends StatefulWidget{
  @override
  State<NavBarRootskip> createState() => _NavBarRootskipState();
}

class _NavBarRootskipState extends State<NavBarRootskip> {
  int _selectedIndex = 0;
  final _screens = [

    //Home Screen
    HomeScreenSkip(),
    SettingsPage(),

    Container(),

    Container(),

    //SettingsScreen(),


  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),
              label: "Home",
            ),

            //BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_text_fill),
            //  label: "Messages",
            //),



            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ) ,

    );
  }
}