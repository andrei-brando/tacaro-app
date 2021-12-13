import 'package:supabase/supabase.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/services/app_database.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupabaseDatabase() {
    init();
  }

  @override
  void init() {
    client = SupabaseClient(
      const String.fromEnvironment('SUPABASE_URL'),
      const String.fromEnvironment('SUPABASE_KEY'),
    );
  }

  @override
  Future<UserModel> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signUp(email, password);

    if (response.error == null) {
      final user = UserModel(id: response.user!.id, email: email, name: name);
      await createUser(user);
      return user;
    } else {
      throw Exception(
        response.error?.message ?? 'Não foi possível criar conta',
      );
    }
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);

    if (response.error == null) {
      final user = UserModel.fromMap(response.user!.toJson());
      return user;
    } else {
      throw Exception(
        response.error?.message ?? 'Não foi possível realizar login',
      );
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.from('users').insert(user.toMap()).execute();
    if (response.error == null) {
      return user;
    } else {
      throw Exception('Não foi possível buscar usuário');
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response =
        await client.from('users').select().filter('id', 'eq', id).execute();

    if (response.error == null) {
      final user = UserModel.fromMap(response.data);
      return user;
    } else {
      throw Exception('Não foi possível buscar usuário');
    }
  }
}
