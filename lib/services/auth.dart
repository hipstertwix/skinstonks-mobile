import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/models/user/auth_user.dart';
import 'package:skinstonks_mobile/models/user/register_model.dart';
import 'package:skinstonks_mobile/models/user/login_model.dart';
import 'package:skinstonks_mobile/models/user/user.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

class AuthService with ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  FlutterSecureStorage _storage;

  AuthUser? _user;

  AuthUser? get user => this._user;

  AuthService(this._storage) {
    this.initAuthService();
  }

  Future<void> initAuthService() async {
    this.validateSession();
  }

  void setAuthUser(AuthUser? authUser) {
    this._user = authUser ?? null;
    this._persistUser();
    notifyListeners();
  }

  void _persistUser() async {
    if (this._user == null) {
      await _storage.delete(key: 'jwtToken');
      await _storage.delete(key: 'refreshToken');
      await _storage.delete(key: 'user');
      return;
    }

    await _storage.write(key: "jwtToken", value: this._user!.jwtToken);
    await _storage.write(key: "refreshToken", value: this._user!.refreshToken);
    await _storage.write(key: "user", value: jsonEncode(this._user!.user.toJson()));
  }

  Future<bool> validateSession() async {
    this._user = await this.getUser();
    if (this._user == null) {
      return false;
    }
    var jwtSplit = this._user!.jwtToken.split(".");
    var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwtSplit[1]))));

    if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000).isAfter(DateTime.now())) {
      return true;
    } else {
      final response = await this.refreshToken(this._user!.refreshToken);
      if (response is Response && response.statusCode == 200) return true;
      return false;
    }
  }

  Future<AuthUser?> getUser() async {
    final String jwtToken = await _storage.read(key: "jwtToken") ?? '';
    final String refreshToken = await _storage.read(key: "refreshToken") ?? '';
    final String user = await _storage.read(key: "user") ?? '';

    if (jwtToken.isNotEmpty && refreshToken.isNotEmpty && user.isNotEmpty) {
      return AuthUser(
        jwtToken: jwtToken,
        refreshToken: refreshToken,
        user: User.fromJson(jsonDecode(user)),
      );
    }

    return null;
  }

  Future refreshToken(String refreshToken) async {
    try {
      var response = await http.post(
        Uri.https(API_URL, AUTH_BASE + "/refresh-token"),
        headers: {"x-auth-refresh-token": refreshToken, "Content-Type": "application/json"},
      );
      if (response is Response && response.statusCode == 200) {
        final resBody = json.decode(response.body);

        this.setAuthUser(AuthUser(
          jwtToken: resBody['jwtToken'],
          refreshToken: resBody['refreshToken'],
          user: User(
            username: resBody['user']['username'],
            email: resBody['user']['email'],
            favoriteItems: resBody['user']['favorite_items'],
          ),
        ));
      } else {
        this.setAuthUser(null);
      }
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Response?> register(RegisterModel registerModel) async {
    String body = json.encode(registerModel);
    try {
      var response = await http.post(
        Uri.https(API_URL, AUTH_BASE + "/register"),
        body: body.toString(),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Response?> login(LoginModel loginModel) async {
    String body = json.encode(loginModel);

    try {
      var response = await http.post(
        Uri.https(API_URL, AUTH_BASE + "/login"),
        body: body.toString(),
        headers: {"Content-Type": "application/json"},
      );
      if (response is Response && response.statusCode == 200) {
        final resBody = json.decode(response.body);

        this.setAuthUser(AuthUser(
          jwtToken: resBody['jwtToken'],
          refreshToken: resBody['refreshToken'],
          user: User(
            username: resBody['user']['username'],
            email: resBody['user']['email'],
            favoriteItems: resBody['user']['favorite_items'],
          ),
        ));

        _navigationService.navigateTo(routes.HomeRoute);
      }
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() {
    this.setAuthUser(null);
    _navigationService.navigateTo(routes.LoginRoute);
  }
}
