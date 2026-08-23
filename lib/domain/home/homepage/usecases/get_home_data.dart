import '../../../../core/error/failures.dart';
import '../entities/home.dart';
import '../repositories/home_repository.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<(Failure?, HomeData?)> call() async {
    return await repository.getHomeData();
  }
}
