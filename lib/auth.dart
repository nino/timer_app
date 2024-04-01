import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<({String? username, String? password})> build() async {
    final storage = await SharedPreferences.getInstance();
    return (
      username: storage.getString('username'),
      password: storage.getString('password')
    );
  }

  Future<void> setCredentials(String username, String password) async {
    final storage = await SharedPreferences.getInstance();
    if (username == '') {
      await storage.remove('username');
    } else {
      await storage.setString('username', username);
    }
    if (password == '') {
      await storage.remove('password');
    } else {
      await storage.setString('password', password);
    }

    state = AsyncData((
      username: username == '' ? null : username,
      password: password == '' ? null : password
    ));
  }
}
