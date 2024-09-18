import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 2, 103, 121),
        elevation: 0,
        title: Text(
          "Forgot Password ?",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              "Enter Your Email and we will send you a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color.fromARGB(199, 0, 0, 0), fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 214, 214, 214),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 0.0),
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  size: 25,
                ),
                hintText: "Email Address",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 70, 70, 70),
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email Cannot be Empty";
                }
                return null;
              },
            ),
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              "Reset Password",
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromARGB(255, 2, 103, 121),
          )
        ],
      ),
    );
  }
}
