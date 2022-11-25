// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/screens/splash.dart';

const saveKey = 'userLoggedIn';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ScreenSplash(),
    );
  }
}
