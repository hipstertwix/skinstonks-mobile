class User {
  final String username;
  final String email;
  List<dynamic>? favoriteItems;
  List<dynamic>? dislikedItems;

  User({
    required this.username,
    required this.email,
    required this.favoriteItems,
    required this.dislikedItems,
  });

  factory User.fromJson(Map<String, dynamic> userJSON) {
    return User(
      username: userJSON['username'],
      email: userJSON['email'],
      favoriteItems: userJSON['favoriteItems'] ?? [],
      dislikedItems: userJSON['dislikedItems'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'favoriteItems': favoriteItems,
      'dislikedItems': dislikedItems,
    };
  }
}
