/// Pure business entity representing an authenticated user.
class User {
  final String accessToken;
  final bool isAuthenticated;

  const User({
    required this.accessToken,
    this.isAuthenticated = false,
  });

  const User.unauthenticated()
      : accessToken = '',
        isAuthenticated = false;
}
