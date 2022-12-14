import 'package:flutter/material.dart';
import 'package:flutter_signinlocal/screens/Login.dart';

class startScreen extends StatefulWidget {
  static String routeName = "/startScreen";
  const startScreen({super.key});

  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}
