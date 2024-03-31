import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  String? _username;
  String? _password;

  AuthModel() {
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final storage = await SharedPreferences.getInstance();
    _username = storage.getString('username');
    _password = storage.getString('password');
    notifyListeners();
  }

  String? get username {
    return _username;
  }

  String? get password {
    return _password;
  }

  Future<void> signIn(String username, String password) async {
    if (username == '') {
      _username = null;
    } else {
      _username = username;
    }
    if (password == '') {
      _password = null;
    } else {
      _password = password;
    }
    final storage = await SharedPreferences.getInstance();

    await storage.setString('username', username);
    await storage.setString('password', password);
    notifyListeners();
  }

  Future<void> signOut() async {
    _username = null;
    _password = null;

    final storage = await SharedPreferences.getInstance();

    await storage.remove('username');
    await storage.remove('password');
    notifyListeners();
  }
}
