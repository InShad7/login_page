import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/meta-logo.png',
          height: 160,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> CheckUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(saveKey);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx1) => HomeScreen()), (route) => false);
    }
  }
}
