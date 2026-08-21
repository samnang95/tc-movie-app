enum SignInStatus { initial, loading, success, failure }

class SignInState {
  final SignInStatus status;
  final String email;
  final String password;
  final String errorMessage;
  final bool obscurePassword;

  const SignInState({
    this.status = SignInStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.obscurePassword = true,
  });

  SignInState copyWith({
    SignInStatus? status,
    String? email,
    String? password,
    String? errorMessage,
    bool? obscurePassword,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
