enum SignUpStatus { initial, loading, success, failure }

class SignUpState {
  final SignUpStatus status;
  final String fullName;
  final String email;
  final String password;
  final String errorMessage;
  final bool obscurePassword;
  final bool agreedToTerms;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.obscurePassword = true,
    this.agreedToTerms = false,
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? fullName,
    String? email,
    String? password,
    String? errorMessage,
    bool? obscurePassword,
    bool? agreedToTerms,
  }) {
    return SignUpState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
    );
  }
}
