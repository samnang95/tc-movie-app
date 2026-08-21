import '../../../../domain/auth/sign_in/entities/sign_in_result.dart';

/// Response model for sign-in API call.
class SignInResponseModel {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const SignInResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: json['expires_at'] != null
          ? DateTime.tryParse(json['expires_at'] as String)
          : null,
    );
  }

  /// Map data model → domain entity.
  SignInResult toEntity() {
    return SignInResult(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }
}
