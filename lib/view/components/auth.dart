import 'package:flutter/material.dart';
import 'package:roombooking/view/screens/login.dart';
import 'package:roombooking/view/screens/signup.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreens);
    } else {
      return Signup(
        showLoginPage: toggleScreens,
      );
    }
  }
}
