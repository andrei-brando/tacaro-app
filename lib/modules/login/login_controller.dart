import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/repository/login_repository.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/utils/state.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;

  LoginController({required this.repository});

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

        final response =
            await repository.login(email: _email, password: _password);

        update(AppState.success<UserModel>(response));
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
