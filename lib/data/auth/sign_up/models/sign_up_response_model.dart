import '../../../../domain/auth/sign_up/entities/sign_up_result.dart';

class SignUpResponseModel {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const SignUpResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: json['expires_at'] != null
          ? DateTime.tryParse(json['expires_at'] as String)
          : null,
    );
  }

  SignUpResult toEntity() {
    return SignUpResult(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }
}
