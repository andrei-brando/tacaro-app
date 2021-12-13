import 'package:flutter/material.dart';

class CreateAccountController {
  String _name = '';
  String _email = '';
  String _password = '';
  final formKey = GlobalKey<FormState>();

  void onChange({String? name, String? email, String? password}) {
    this._name = name ?? this._name;
    this._email = email ?? this._email;
    this._email = password ?? this._password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (!form.validate()) return false;

    form.save();
    return true;
  }

  void create() {
    if (validate()) {
      print('pode chamar o backend');
    }
  }
}
