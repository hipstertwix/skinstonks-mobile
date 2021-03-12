class LoginModel {
  final String username;
  final String password;

  LoginModel(this.username, this.password);

  Map toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
