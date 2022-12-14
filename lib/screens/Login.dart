import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            child: Center(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.9,
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signIn();
                    }
                  },
                  label: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 50),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUp.routeName);
                      },
                      child: const Text(
                        "Don't have an account? Click here to Sign Up.",
                        style: TextStyle(fontSize: 15.0, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    )));
  }

  Future signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      final uidCredential = credential.user?.uid as String;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', uidCredential);

      await Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
