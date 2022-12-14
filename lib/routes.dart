import 'package:flutter/material.dart';
import 'package:flutter_signinlocal/screens/Dashboard.dart';
import 'package:flutter_signinlocal/screens/Login.dart';
import 'package:flutter_signinlocal/screens/Settings.dart';
import 'package:flutter_signinlocal/screens/startScreen.dart';
import 'package:flutter_signinlocal/screens/SignUp.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
  startScreen.routeName: (BuildContext context) => startScreen(),
  SignUp.routeName: (BuildContext context) => SignUp(),
};
