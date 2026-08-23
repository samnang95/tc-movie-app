import '../../../core/error/failures.dart';
import '../entities/search.dart';
import '../entities/search_item.dart';

abstract class SearchRepository {
  Future<(Failure?, SearchData?)> getSearchData();
  Future<(Failure?, List<SearchItem>?)> getRecommended();
}
