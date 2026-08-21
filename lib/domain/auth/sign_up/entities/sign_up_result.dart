class SignUpResult {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const SignUpResult({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });
}
