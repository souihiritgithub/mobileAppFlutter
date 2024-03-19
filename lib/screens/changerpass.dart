import 'package:coursefirebase_app/screens/settings.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _changePassword() {
// Implement the logic to change the password here
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;


// Check conditions and perform password update
    if (oldPassword.isNotEmpty && newPassword.isNotEmpty && confirmPassword.isNotEmpty) {
      if (newPassword == confirmPassword) {
        // Perform password update
        // Show a success dialog or message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Mot de passe modifié'),
              content: Text('Votre mot de passe a été modifié avec succès.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Show an error dialog or message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Erreur de confirmation'),
              content: Text('Le nouveau mot de passe et la confirmation ne correspondent pas.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Show an error dialog or message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Champs vides'),
            content: Text('Veuillez remplir tous les champs.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Change password'),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsPage()),
    );
    },
    ),
    ),
    body: Container(
    color: Colors.blue[50], // Calm blue background color
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFormField(
    controller: _oldPasswordController,
    style: TextStyle(fontSize: 18.0),
    decoration: InputDecoration(
    labelText: 'Previous password',
    ),
    obscureText: true,
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _newPasswordController,
    style: TextStyle(fontSize: 18.0),
    decoration: InputDecoration(
    labelText: 'New password',
    ),
    obscureText: true,
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _confirmPasswordController,
    style: TextStyle(fontSize: 18.0),
    decoration: InputDecoration(
    labelText: 'Confirm password',
    ),
    obscureText: true,
    ),
    SizedBox(height: 24.0),
    ElevatedButton(
    onPressed: _changePassword,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        primary: Colors.blue,
        onPrimary: Colors.white,
      ),
      child: Text(
        'Change password',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    ],
    ),
    ),
    );
  }
}






