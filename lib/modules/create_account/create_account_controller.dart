import 'package:flutter/material.dart';
import 'package:tacaro/shared/utils/state.dart';

class CreateAccountController extends ChangeNotifier {
  AppState state = AppState.empty();

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

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await Future.delayed(Duration(seconds: 3));
        update(AppState.success<String>('Deu certo'));
      } catch (e) {
        update(AppState.error('Não foi possível criar a conta'));
      }
    }
  }
}
