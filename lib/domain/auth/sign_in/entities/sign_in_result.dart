/// Pure business entity representing a successful sign-in result.
/// No framework or serialization dependencies.
class SignInResult {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const SignInResult({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });
}
