import 'package:coursefirebase_app/screens/signInScreen.dart';

import 'package:flutter/material.dart';

import 'home.dart';

class SignUpRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
        ),
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(0.5),
              child: Image.asset("assets/images/successB.png"),
            ),
            SizedBox(height: 50),
            Text(
              "Account Created!",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Log In Now",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
