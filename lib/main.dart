import 'package:flutter/material.dart';
import 'package:Swiggy_Holocron/login.dart';
// import  'package:starter.dart';
import 'home.dart';
import 'login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holocron OAuth',
      home: LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        inputDecorationTheme: const InputDecorationTheme(),
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.orange)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}