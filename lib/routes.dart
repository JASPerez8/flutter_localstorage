import 'package:flutter/material.dart';
import 'package:flutter_signinlocal/screens/Dashboard.dart';
import 'package:flutter_signinlocal/screens/Settings.dart';

final Map<String, WidgetBuilder> routes = {
  // Login.routeName: (BuildContext context) => Login(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
};
