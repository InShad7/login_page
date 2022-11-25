import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

const username = 'admin';
const password = 'pass';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordCOntroller = TextEditingController();

  bool _dataMatch = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login Page')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/WhatsApp-Logo-PNG-Transparent-Image.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0),
                          boxShadow: [
                            BoxShadow(color: Colors.teal, offset: Offset(0, 4))
                          ]),
                      child: TextFormField(
                        controller: _usernameController,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey,
                              fontFamily: 'Ubuntu'),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Username is empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, offset: Offset(0, 4))
                        ]),
                    child: TextFormField(
                      style: TextStyle(),
                      controller: _passwordCOntroller,
                      // textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontFamily: 'Ubuntu'),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim() == '') {
                          return 'Password is empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: !_dataMatch,
                        child: Text(
                          'username password incorrect',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  checkLogin(context);
                                }
                                // checkLogin(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.teal),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordCOntroller.text;

    if (_username == username && _password == password) {
      print('username passwrord matched');

      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(saveKey, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    } else {
      setState(() {
        _dataMatch = false;
      });

      print('username password doesnt match');
    }
  }
}
