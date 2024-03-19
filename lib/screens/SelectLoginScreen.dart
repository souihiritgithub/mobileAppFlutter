import 'package:coursefirebase_app/screens/signInScreen.dart';
import 'package:coursefirebase_app/screens/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectLoginScreen extends StatefulWidget{
  const SelectLoginScreen({super.key});

  @override
  State<SelectLoginScreen> createState() => _SelectLoginScreenState();

}
   class _SelectLoginScreenState extends State<SelectLoginScreen>{
  @override
     Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SignUp(),
      ));

      },
                child: Text(
                     'sign up'
                          )
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                  builder: (context) => SignIn(),

                  ));
                } ,
              child: Text(
                'sign in'
              ),
            ),
            ],

        ),
      ),
    );
  }
   }











