import '../../../../core/error/failures.dart';
import '../entities/home.dart';

abstract class HomeRepository {
  Future<(Failure?, HomeData?)> getHomeData();
}
