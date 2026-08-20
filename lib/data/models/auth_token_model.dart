class AuthTokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const AuthTokenModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: json['expires_at'] != null
          ? DateTime.tryParse(json['expires_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  /// Whether the access token has expired (with 30s buffer).
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(
      expiresAt!.subtract(const Duration(seconds: 30)),
    );
  }
}
