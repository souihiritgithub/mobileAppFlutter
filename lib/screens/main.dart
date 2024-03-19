import 'package:flutter/material.dart';
import 'package:coursefirebase_app/screens/signUpScreen.dart';
import 'package:coursefirebase_app/screens/signInScreen.dart';
import 'SelectLoginScreen.dart';
import 'package:coursefirebase_app/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

}



class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,

      ),


       debugShowCheckedModeBanner: false,

       home: WelcomeScreen(),
    );
  }
}

