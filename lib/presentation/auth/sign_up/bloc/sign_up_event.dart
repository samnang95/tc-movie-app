abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpFullNameChanged extends SignUpEvent {
  final String fullName;
  const SignUpFullNameChanged(this.fullName);
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  const SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  const SignUpPasswordChanged(this.password);
}

class SignUpTogglePassword extends SignUpEvent {
  const SignUpTogglePassword();
}

class SignUpToggleTerms extends SignUpEvent {
  const SignUpToggleTerms();
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
