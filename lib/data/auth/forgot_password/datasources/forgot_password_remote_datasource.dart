import '../../../../core/network/api_client.dart';
import '../models/forgot_password_request_model.dart';
import '../models/forgot_password_response_model.dart';

class ForgotPasswordRemoteDataSource {
  final ApiClient _apiClient;

  ForgotPasswordRemoteDataSource(this._apiClient);

  Future<ForgotPasswordResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    final response = await _apiClient.post(
      '/auth/forgot-password',
      data: request.toJson(),
    );
    return ForgotPasswordResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
