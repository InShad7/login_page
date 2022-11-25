import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List names = ['Jerry', 'Mark'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Home'),
        actions: [
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx1) {
                          return AlertDialog(
                            content: Text('Are you sure you want to Log out?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  signout(context);
                                },
                                child: Text(
                                  'LogOut',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx1).pop();
                                  },
                                  child: Text(
                                    'No',
                                  ),
                                  ),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return ListTile(
                  // tileColor: Colors.grey,
                  title: Text(
                    '${names[0]}',
                    style: TextStyle(fontSize: 19, fontFamily: 'Lato'),
                  ),
                  subtitle: const Text(
                    'Lorem Ipsum is simply dummy text..',
                    style: TextStyle(fontFamily: 'Ubuntu', fontSize: 13),
                  ),
                  leading: ClipRect(
                    child: Image.asset('assets/images/images.png'),
                  ),
                  trailing: Text('0$index:00 PM'),
                );
              } else {
                return ListTile(
                  // tileColor: Colors.grey,
                  title: Text('${names[1]}',
                      style: TextStyle(fontSize: 19, fontFamily: 'Lato')),
                  subtitle: const Text(
                    '"But I must explain to you how all this...',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/download.jpeg'),
                    radius: 30,
                  ),
                  trailing: Text('0$index:00 PM'),
                );
              }
            },
            itemCount: 30),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
