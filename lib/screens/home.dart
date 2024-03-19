import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/navbar_roots.dart';
import 'signInScreen.dart';
import 'signUpScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(



      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Container(

            /*child: Text(
              'Home',


              style: TextStyle(color: Colors.black54,
                fontSize: 18,

              ),

            ),*/

          ),

          ),








      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(


          children: [



            Positioned(
              top: 0,
              left: 10,
              right: 220,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 3.5, // Augmentez cette valeur pour augmenter la taille de l'image
                  //child: Image.asset(
                   // "assets/images/logo.png",
                 // ),
                ),
              ),
            ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavBarRootskip()),
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
            //SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Transform.scale(
                  scale: 1.15, // Augmentez cette valeur pour augmenter la taille de l'image
                  child: Image.asset(
                    "assets/images/home-care-image.png",
                  ),
                ),

              ),
            ),
            //SizedBox(height: 0),
            Text(
              "Healthcare App",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Appoint your Doctor",
              style: TextStyle(
                color: Color(0x5B2264DA),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0x5B2264DA),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color(0x5B042741),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}