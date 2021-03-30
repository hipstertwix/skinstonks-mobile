class User {
  final String username;
  final String email;
  final List<dynamic>? favoriteItems;

  User({required this.username, required this.email, required this.favoriteItems});

  factory User.fromJson(Map<String, dynamic> userJSON) {
    return User(
      username: userJSON['username'],
      email: userJSON['email'],
      favoriteItems: userJSON['favoriteItems'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'favoriteItems': favoriteItems,
    };
  }
}
