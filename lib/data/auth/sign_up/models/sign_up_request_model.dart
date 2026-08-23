class SignUpRequestModel {
  final String fullName;
  final String email;
  final String password;

  const SignUpRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'password': password,
  };
}
