import '../../../core/error/failures.dart';
import '../entities/search_item.dart';
import '../repositories/search_repository.dart';

/// Use case: Fetch recommended search items.
class GetRecommended {
  final SearchRepository _repository;

  GetRecommended(this._repository);

  Future<(Failure?, List<SearchItem>?)> call() => _repository.getRecommended();
}
