import '../../../core/error/failures.dart';
import '../entities/search.dart';
import '../repositories/search_repository.dart';

class GetSearchData {
  final SearchRepository repository;

  GetSearchData(this.repository);

  Future<(Failure?, SearchData?)> call() async {
    return await repository.getSearchData();
  }
}
