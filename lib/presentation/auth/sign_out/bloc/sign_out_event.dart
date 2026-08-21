abstract class SignOutEvent {
  const SignOutEvent();
}

/// User requested to sign out.
class SignOutRequested extends SignOutEvent {
  const SignOutRequested();
}
