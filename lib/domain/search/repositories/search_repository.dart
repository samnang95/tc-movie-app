import '../../../core/error/failures.dart';
import '../entities/search_item.dart';

/// Abstract repository contract for search data.
abstract class SearchRepository {
  Future<(Failure?, List<SearchItem>?)> getRecommended();
}
