import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' show json;

import 'package:skinstonks_mobile/model/user/register_model.dart';
import 'package:skinstonks_mobile/model/user/login_model.dart';

class LoginFailure {
  String message;
  LoginFailure(this.message);
}

class AuthService {
  static const String _API = "skinstonks.herokuapp.com";
  static const String _AUTH_BASE = "/api/auth";

  static Future<Response> register(RegisterModel registerModel) {
    String body = json.encode(registerModel);

    return http.post(
      Uri.https(_API, _AUTH_BASE + "/register"),
      body: body.toString(),
      headers: {"Content-Type": "application/json"},
    );
  }

  static Future<Response> login(LoginModel loginModel) {
    String body = json.encode(loginModel);

    return http.post(
      Uri.https(_API, _AUTH_BASE + "/login"),
      body: body.toString(),
      headers: {"Content-Type": "application/json"},
    );
  }
}
