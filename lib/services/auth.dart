import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/models/user/auth_user.dart';
import 'package:skinstonks_mobile/models/user/register_model.dart';
import 'package:skinstonks_mobile/models/user/login_model.dart';
import 'package:skinstonks_mobile/models/user/user.dart';
import 'package:skinstonks_mobile/services/api_base_helper.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';
import 'package:skinstonks_mobile/constants/route_paths.dart' as routes;

class AuthService with ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  late ApiBaseHelper _apiBaseHelper;

  FlutterSecureStorage _storage;

  AuthUser? _user;

  AuthUser? get user => this._user;
  User? get userData => this._user != null ? this._user!.user : null;

  AuthService(this._storage) {
    this.initAuthService();
  }

  Future<void> initAuthService() async {
    this._apiBaseHelper = ApiBaseHelper(authService: this);
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
      final bool refreshed = await this.refreshToken();
      return refreshed;
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

  Future getUserData() async {
    if (this._user == null) return;
    try {
      final response = await this._apiBaseHelper.callApi('GET', USER_BASE + "/me");
      return response;
    } catch (err) {
      throw err;
    }
  }

  Future<bool> refreshToken() async {
    try {
      var response = await this._apiBaseHelper.callApi(
        'POST',
        AUTH_BASE + "/refresh-token",
        customHeaders: {"x-auth-refresh-token": this._user!.refreshToken},
      );

      if (response == null) {
        this.setAuthUser(null);
        return false;
      }

      this.setAuthUser(AuthUser(
        jwtToken: response['jwtToken'],
        refreshToken: response['refreshToken'],
        user: User(
          username: response['user']['username'],
          email: response['user']['email'],
          favoriteItems: response['user']['favorite_items'],
          dislikedItems: response['user']['disliked_items'],
        ),
      ));
      return true;
    } catch (err) {
      throw err;
    }
  }

  Future<void> register(RegisterModel registerModel) async {
    try {
      await this._apiBaseHelper.callApi(
            'POST',
            AUTH_BASE + "/register",
            body: registerModel.toJson(),
          );
    } catch (err) {
      throw err;
    }
  }

  Future<void> login(LoginModel loginModel) async {
    try {
      var response = await this._apiBaseHelper.callApi(
            'POST',
            AUTH_BASE + "/login",
            body: loginModel.toJson(),
          );
      if (response == null) return;

      this.setAuthUser(AuthUser(
        jwtToken: response['jwtToken'],
        refreshToken: response['refreshToken'],
        user: User(
          username: response['user']['username'],
          email: response['user']['email'],
          favoriteItems: response['user']['favorite_items'],
          dislikedItems: response['user']['disliked_items'],
        ),
      ));
      _navigationService.navigateTo(routes.HomeRoute);
    } catch (err) {
      throw err;
    }
  }

  void logout() {
    this.setAuthUser(null);
    _navigationService.navigateTo(routes.LoginRoute);
  }
}
