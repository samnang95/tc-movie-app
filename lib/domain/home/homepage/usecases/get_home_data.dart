import '../../../../core/error/failures.dart';
import '../entities/home.dart';
import '../repositories/home_repository.dart';

/// Use case: Fetch home page data.
class GetHomeData {
  final HomeRepository _repository;

  GetHomeData(this._repository);

  Future<(Failure?, List<HomeItem>?)> call() => _repository.getHomeData();
}
