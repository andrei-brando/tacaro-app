import 'package:tacaro/modules/login/repository/login_repository.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/services/app_database.dart';

class LoginRepositoryImp implements LoginRepository {
  final AppDatabase database;

  LoginRepositoryImp({
    required this.database,
  });

  @override
  Future<UserModel> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await database.createAccount(
        name: name, email: email, password: password);
    return response;
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await database.login(email: email, password: password);
    return response;
  }
}
