import 'package:skinstonks_mobile/models/user/user.dart';

class AuthUser {
  User user;
  String jwtToken;
  String refreshToken;

  AuthUser({
    required this.user,
    required this.jwtToken,
    required this.refreshToken,
  });
}
