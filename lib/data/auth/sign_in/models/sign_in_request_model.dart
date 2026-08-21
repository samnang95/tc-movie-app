/// Request model for sign-in API call.
class SignInRequestModel {
  final String email;
  final String password;

  const SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
