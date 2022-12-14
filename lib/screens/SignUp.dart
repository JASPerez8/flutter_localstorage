import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class SignUp extends StatefulWidget {
  static String routeName = "/signUp";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  child: Column(
                    children: [
                      const Text(
                        "Sign Up to Create an Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                          }),
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
                      TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.account_box),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signUp();
                          }
                        },
                        label: Text("Sign Up"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 50),
                            backgroundColor: Colors.green),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.login),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        },
                        label: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.maxFinite, 50),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await Navigator.pushReplacementNamed(context, Login.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
