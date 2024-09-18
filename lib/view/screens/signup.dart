import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/view/screens/login.dart';

class Signup extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Signup({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //text controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String _username;
  late String _email;
  late String _password;
  late String _comformPassword;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addUserDetails(
          _usernameController.text.trim(), _emailController.text.trim());
    }
  }

  Future addUserDetails(String username, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/bg/bg4.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            decoration:
                BoxDecoration(color: const Color.fromARGB(110, 255, 255, 255)),
          ),
          SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 280,
                ),
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(156, 8, 88, 122),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: ListView(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                            vertical: 45,
                          )),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_3,
                                  size: 35,
                                ),
                                hintText: "User name ",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Username Cannot be Empty";
                                }
                                return null;
                              },
                              onSaved: (text) {
                                _username = text!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
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
                                  size: 30,
                                ),
                                hintText: "Email Address",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email Cannot be Empty";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                prefixIcon: Icon(
                                  Icons.fingerprint_sharp,
                                  size: 35,
                                ),
                                hintText: "Create Password ",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 57, 57, 57),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password Cannot be Empty";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _password = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: _confirmpasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                prefixIcon: Icon(
                                  Icons.fingerprint_sharp,
                                  size: 35,
                                ),
                                hintText: "Comform Password ",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 51, 51, 51),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Comform Password Cannot be Empty";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _comformPassword = value!;
                              },
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState?.save();
                                  print(_username);
                                  print(_email);
                                  print(_password);
                                  print(_comformPassword);
                                  signUp();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login(
                                                showRegisterPage: () {},
                                              )));
                                  widget.showLoginPage;
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  "Signup",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account ",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 69, 69, 69),
                                        fontSize: 16,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login(
                                                      showRegisterPage: () {},
                                                    )));
                                        widget.showLoginPage;
                                      },
                                      child: Text(" Login",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 132, 226, 226),
                                            fontSize: 18,
                                          ))),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
