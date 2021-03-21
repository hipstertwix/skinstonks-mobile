import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:skinstonks_mobile/models/user/register_model.dart';
import 'package:skinstonks_mobile/models/user/login_model.dart';

class AuthFailure {
  String message;
  AuthFailure(this.message);
}

class AuthService {
  static const String _API = "skinstonks.herokuapp.com";
  static const String _AUTH_BASE = "/api/auth";

  static Future refreshToken(String refreshToken) async {
    try {
      var response = await http.post(
        Uri.https(_API, _AUTH_BASE + "/refresh-token"),
        headers: {"x-auth-refresh-token": refreshToken, "Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future register(RegisterModel registerModel) async {
    String body = json.encode(registerModel);
    try {
      var response = await http.post(
        Uri.https(_API, _AUTH_BASE + "/register"),
        body: body.toString(),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future login(LoginModel loginModel) async {
    String body = json.encode(loginModel);

    try {
      var response = await http.post(
        Uri.https(_API, _AUTH_BASE + "/login"),
        body: body.toString(),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
