import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'changerpass.dart';
import 'home.dart';
import 'home_screen.dart';
import 'home_screen_skip.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _receiveNotifications = true;
  bool _darkMode = false;

  void _toggleNotifications(bool value) {
    setState(() {
      _receiveNotifications = value;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });


// Call a function to enable/disable dark mode in your application
    if (_darkMode) {
      // Enable dark mode
      // Use ThemeData.dark() for the dark theme
      // Recommended approach: You can also store the dark mode preference in user preferences and apply the theme based on the preference.
    } else {
      // Enable light mode
      // Use ThemeData.light() for the light theme
      // Recommended approach: You can also store the dark mode preference in user preferences and apply the theme based on the preference.
    }
  }

  void _navigateToChangePassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
    );
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = _darkMode ? ThemeData.dark() : ThemeData.light();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon application',
      theme: appTheme.copyWith(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
        // Change the accent color to blue
        // Set other custom styles or themes here
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NavBarRootskip()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              title: Text('Receive notifications'),
              activeColor: Colors.blue,
              value: _receiveNotifications,
              onChanged: _toggleNotifications,
            ),
            SwitchListTile.adaptive(
              title: Text('Dark mode'),
              activeColor: Colors.blue,
              value: _darkMode,
              onChanged: _toggleDarkMode,
            ),
          //  ListTile(
            //  title: Text('Change password'),
            //  trailing: Icon(Icons.arrow_forward_ios),
            // onTap: _navigateToChangePassword,
           // ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.exit_to_app),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
