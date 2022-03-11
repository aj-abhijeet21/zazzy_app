import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zazzy_app/models/auth.dart';

class AuthService {
  String response = '''
{
  "userid": "john@gmail.com",
  "password": "John@123"
}
''';

  Future<bool> login({
    required String username,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return false;
    Future.delayed(const Duration(seconds: 5));
    var jsonData = jsonDecode(response);
    AuthModel auth = AuthModel.fromJson(jsonData);

    if (auth.userid.compareTo(username) == 0 &&
        auth.password.compareTo(password) == 0) {
      return true;
    } else {
      return false;
    }
  }
}
