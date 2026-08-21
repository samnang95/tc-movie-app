abstract class SignInEvent {
  const SignInEvent();
}

/// User typed into the email field.
class SignInEmailChanged extends SignInEvent {
  final String email;
  const SignInEmailChanged(this.email);
}

/// User typed into the password field.
class SignInPasswordChanged extends SignInEvent {
  final String password;
  const SignInPasswordChanged(this.password);
}

/// User toggled password visibility.
class SignInTogglePassword extends SignInEvent {
  const SignInTogglePassword();
}

/// User tapped the Sign In button.
class SignInSubmitted extends SignInEvent {
  const SignInSubmitted();
}

/// User tapped the Google sign-in button.
class SignInWithGoogle extends SignInEvent {
  const SignInWithGoogle();
}

/// User tapped the Apple sign-in button.
class SignInWithApple extends SignInEvent {
  const SignInWithApple();
}
