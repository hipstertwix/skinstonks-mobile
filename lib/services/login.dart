import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' show json;

import 'package:skinsstonks_mobile/model/user/register_user_data.dart';

class LoginFailure {
  String message;
  LoginFailure(this.message);
}

class LoginService {
  static const String _API = "skinstonks.herokuapp.com";
  static const String _AUTH_BASE = "/api/auth";

  static Future<Response> registerNewUser(RegisterUserData registerUserData) {
    String body = json.encode(registerUserData);

    return http.post(
      Uri.https(_API, _AUTH_BASE + "/register"),
      body: body.toString(),
      headers: {"Content-Type": "application/json"},
    );
  }
}
