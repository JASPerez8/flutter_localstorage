import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signinlocal/routes.dart';
import 'package:flutter_signinlocal/screens/startScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Dashboard.dart';
import 'screens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var uid = prefs.getString('uid');
  runApp(MaterialApp(
    initialRoute: (uid == null ? Login.routeName : Dashboard.routeName),
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
