enum SignOutStatus { initial, loading, success, failure }

class SignOutState {
  final SignOutStatus status;
  final String errorMessage;

  const SignOutState({
    this.status = SignOutStatus.initial,
    this.errorMessage = '',
  });

  SignOutState copyWith({
    SignOutStatus? status,
    String? errorMessage,
  }) {
    return SignOutState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
