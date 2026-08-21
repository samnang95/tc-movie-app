import '../../../../domain/auth/forgot_password/entities/forgot_password_result.dart';

class ForgotPasswordResponseModel {
  final String message;

  const ForgotPasswordResponseModel({required this.message});

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      message: json['message'] as String? ?? 'Reset link sent successfully',
    );
  }

  ForgotPasswordResult toEntity() {
    return ForgotPasswordResult(message: message);
  }
}
