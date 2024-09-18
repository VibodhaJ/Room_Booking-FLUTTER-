import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roombooking/view/components/auth.dart';
import 'package:roombooking/view/components/navibar.dart';
import 'package:roombooking/view/screens/home2.dart';
import 'package:roombooking/view/screens/login.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Navbar();
            } else {
              return Auth();
            }
          }),
    );
  }
}
