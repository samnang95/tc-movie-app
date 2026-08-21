import '../../../../core/error/failures.dart';

/// Abstract repository contract for sign-out.
abstract class SignOutRepository {
  Future<(Failure?, bool?)> signOut();
}
