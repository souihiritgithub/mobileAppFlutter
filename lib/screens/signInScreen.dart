import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/navbar.dart';
import '../widgets/navbar_roots.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;
  var showpass = true;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Container(
                 // padding: EdgeInsets.all(10),
                  //alignment: Alignment.centerLeft,
                 // child: Transform.scale(
                    //scale: 1.8,
                    //child: Image.asset(
                    //  "assets/images/logo.png",
                   // ),
                 // ),
               // ),


                SizedBox(height: 20),
                Text(
                  'Sign In Now',
                  style: TextStyle(
                    color: Color(0xFF7EBBE5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
            SizedBox(height: 0),
            Padding(
              padding: EdgeInsets.all(0.5),
              child: Image.asset("assets/images/doctorlogin.png"),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: ' Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: showpass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showpass = false;
                      });
                    },
                    icon: Icon(Icons.password),
                  ),
                  labelText: " Password ",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var user = await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavBarRoots(),
                          ),
                        );
                      }
                    } catch (e) {
                      setState(() {
                        errorMessage = 'Invalid email or password.';
                      });
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarRootskip(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                  ),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

                SizedBox(height: 10),
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

