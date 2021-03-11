class RegisterUserData {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserData(
      this.username, this.email, this.password, this.confirmPassword);

  Map toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }
}
