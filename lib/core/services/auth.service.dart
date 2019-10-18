import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/libs/rest.lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  RestLib _rest = RestLib();

  Future<void> autenticar({
    @required String login,
    @required String password,
  }) async {
    try {
      var body = {
        'username': login,
        'password': password,
      };

      final token = await _rest.post(
        url: 'users/authenticate',
        body: body,
      );

      var _prefs = await SharedPreferences.getInstance();
      await _prefs.setString('token', token);
    } catch (err) {
      rethrow;
    }
  }
}
