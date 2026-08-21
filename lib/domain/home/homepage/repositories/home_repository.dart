import '../../../../core/error/failures.dart';
import '../entities/home.dart';

/// Abstract repository contract for home page data.
abstract class HomeRepository {
  Future<(Failure?, List<HomeItem>?)> getHomeData();
}
