import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart';
import 'package:roombooking/view/components/forgot_password.dart';
import 'package:roombooking/view/components/navibar.dart';
import 'package:roombooking/view/screens/home.dart';
import 'package:roombooking/view/screens/signup.dart';

import '../../controller/logincontraller.dart';
import '../components/validate.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final LoginController controller = LoginController();

  late String _username;
  late String _password;

  // Login Valid?

  // TextEditingController usernameContoller = TextEditingController();
  // TextEditingController passwordContoller = TextEditingController();

  // void login(String username, password) async {
  //   try {
  //     Response response = await post(
  //         Uri.parse("https://reqres.in/api/register"),
  //         body: {'email': username, 'password': password});
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data["token"]);
  //       print("Login Successfully");
  //       successMessage(context);
  //     } else {
  //       print("faild");
  //       errorMessage(context);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
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
              key: controller.formKey,
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
                                  controller: _emailController,
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
                                      return "Name Cannot be Empty";
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
                                  obscureText: true,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon:
                                        Icon(Icons.remove_red_eye_sharp),
                                    prefixIcon: Icon(
                                      Icons.fingerprint_sharp,
                                      size: 35,
                                    ),
                                    hintText: "Password ",
                                    hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
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
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState?.save();
                                      print(_username);
                                      print(_password);
                                      signIn();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Navbar(),
                                      //   ),
                                      // );
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
                                      "Login Here",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ForgotPasswordPage();
                                    }));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text("Forget Password?",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 69, 69, 69),
                                          fontSize: 16,
                                        )),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Or",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 47, 47, 47),
                                        fontSize: 13,
                                      )),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 50,
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                            "assets/facebook.png",
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 50,
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                            "assets/google.png",
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? ",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 69, 69, 69),
                                            fontSize: 16,
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            widget.showRegisterPage;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Signup(
                                                          showLoginPage: () {},
                                                        )));
                                          },
                                          child: Text(" Sign Up",
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
