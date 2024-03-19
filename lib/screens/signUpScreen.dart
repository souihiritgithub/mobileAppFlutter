import 'package:coursefirebase_app/screens/signupredirect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  var showpass = true;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          child: Text(
            'Sign Up',

            style: TextStyle(color: Colors.black54,
              fontSize: 18,

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
                Text(

                  'Sign Up Now',
                  style: TextStyle(fontSize: 20,

                    fontWeight: FontWeight.bold,
                    color: Color(0x5B2264DA),

                  ),

                ),


                Padding(
                  padding: EdgeInsets.all(0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/signupb.png",
                    ),
                  ),
                ),






                SizedBox(
                  height: 20,

                ),

                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(


                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed:()  {

                          },
                          icon: Icon(Icons.abc_outlined)
                      ),

                      labelText: " User Name ",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    ),
                  ),
                ),


                SizedBox(
                  height: 20,

                ),

                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(


                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed:()  {

                          },
                          icon: Icon(Icons.numbers_rounded)
                      ),


                      labelText: " Phone Number ",
                      prefixIcon: Icon(Icons.phone),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    ),
                  ),
                ),


                SizedBox(
                  height: 20,

                ),

                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    onChanged: (value) {
                      email = value ;
                    },


                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed:()  {
                            setState(() {
                              showpass = false;

                            });
                          },
                          icon: Icon(Icons.create)
                      ),

                      labelText: " Email ",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    ),
                  ),
                ),




                SizedBox(
                  height: 20,

                ),

                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    onChanged: (value) {
                      password = value ;
                    },
                    obscureText: showpass,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed:()  {
                            setState(() {
                              showpass = false;

                            });
                          },
                          icon: Icon(Icons.password)),

                      labelText: " Password ",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    ),
                  ),
                ),

            SizedBox(
              height: 20,

            ),

              ElevatedButton(
                onPressed: () async {
                  try {
                    var userCredential = await auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    var user = userCredential.user;
                    if (user != null) {
                      // User creation successful, navigate to SignUpRedirect
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpRedirect()),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      // Show a message if the user already exists
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('The email address is already in use.')),
                      );
                    } else {
                      // Show an error message for other FirebaseAuthExceptions
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('An error occurred, please try again later.')),
                      );
                    }
                  } catch (e) {
                    // Show a generic error message for other exceptions
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('An error occurred, please try again later.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54, // Changer la couleur du bouton en bleu
                ),
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.blue, // Changer la couleur du texte en blanc
                  ),
                ),
              )




          ],
      ),
    ),
    ),
    ),
    );
}
}








