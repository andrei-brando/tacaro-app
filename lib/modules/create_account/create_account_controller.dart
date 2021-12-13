import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/repository/login_repository.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/utils/state.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepository repository;
  CreateAccountController({required this.repository});

  AppState state = AppState.empty();

  String _name = '';
  String _email = '';
  String _password = '';
  final formKey = GlobalKey<FormState>();

  void onChange({String? name, String? email, String? password}) {
    this._name = name ?? this._name;
    this._email = email ?? this._email;
    this._password = password ?? this._password;
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
        final response = await repository.createAccount(
          name: _name,
          email: _email,
          password: _password,
        );
        update(AppState.success<UserModel>(response));
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
