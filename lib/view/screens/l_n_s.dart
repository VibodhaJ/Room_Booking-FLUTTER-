import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/view/screens/signup.dart';

import 'login.dart';

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/bg/bg2.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white30),
          ),
          SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: 211,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 75),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(156, 8, 88, 122),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                          vertical: 65,
                        )),
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(
                                  showLoginPage: () {},
                                ),
                              ),
                            );
                          },
                          height: 47,
                          minWidth: double.infinity,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          elevation: 0,
                          child: Text(
                            "Sign Up ",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(
                                  showRegisterPage: () {},
                                ),
                              ),
                            );
                          },
                          height: 47,
                          minWidth: double.infinity,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          elevation: 0,
                          child: Text(
                            "Login Here ",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
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
