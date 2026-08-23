import '../../my_list/entities/movie_detail.dart';

class SearchData {
  final List<String> trendingSearches;
  final List<MovieDetail> recommended;

  const SearchData({required this.trendingSearches, required this.recommended});
}
