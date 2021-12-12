import 'package:flutter/material.dart';

class LoginController {
  String _email = '';
  String _password = '';
  final formKey = GlobalKey<FormState>();

  void onChange({String? email, String? password}) {
    this._email = email ?? this._email;
    this._email = password ?? this._password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (!form.validate()) return false;

    form.save();
    return true;
  }

  void login() {
    if (validate()) {
      print('pode chamar o backend');
    }
  }
}
