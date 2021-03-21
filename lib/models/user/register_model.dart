class RegisterModel {
  final String username;
  final String email;
  final String password;

  RegisterModel(this.username, this.email, this.password);

  Map toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
