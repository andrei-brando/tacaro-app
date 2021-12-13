import 'package:flutter/material.dart';
import 'package:tacaro/shared/utils/state.dart';

class LoginController extends ChangeNotifier {
  AppState state = AppState.empty();

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

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());

        await Future.delayed(Duration(seconds: 4));

        update(AppState.success<String>('usuário logado'));
      } catch (e) {
        update(AppState.error('não foi possível fazer login'));
      }
    }
  }
}
