import '../../../domain/search/entities/search_item.dart';

enum SearchStatus { initial, loading, loaded, failure }

class SearchState {
  final SearchStatus status;
  final List<SearchItem> recommended;
  final String errorMessage;

  const SearchState({
    this.status = SearchStatus.initial,
    this.recommended = const [],
    this.errorMessage = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<SearchItem>? recommended,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      recommended: recommended ?? this.recommended,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
