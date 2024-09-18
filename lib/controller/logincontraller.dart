import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name;
  late String password;

  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      print(name);
      print(password);
    }
  }

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse("https://reqres.in/api/register"),
          body: {'email': username, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("Login Successfully");
      } else {
        print("faild");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
