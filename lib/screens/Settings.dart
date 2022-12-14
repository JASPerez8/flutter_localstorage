import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              signOut();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
        Login.routeName, (Route<dynamic> route) => false);
  }
}
