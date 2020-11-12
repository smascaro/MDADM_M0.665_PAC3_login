import 'package:flutter/material.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application..
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Raleway"),
      home: LoginScreen(),
      routes: {MainScreen.routeName: (context) => MainScreen()},
    );
  }
}
