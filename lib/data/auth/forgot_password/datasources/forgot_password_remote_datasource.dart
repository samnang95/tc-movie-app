import '../../../../core/network/api_client.dart';
import '../models/forgot_password_request_model.dart';
import '../models/forgot_password_response_model.dart';

class ForgotPasswordRemoteDataSource {
  // ignore: unused_field
  final ApiClient _apiClient;

  ForgotPasswordRemoteDataSource(this._apiClient);

  Future<ForgotPasswordResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    // Mocking the API response
    await Future.delayed(const Duration(seconds: 1));
    return const ForgotPasswordResponseModel(
      message: 'Reset link sent successfully',
    );
  }
}
