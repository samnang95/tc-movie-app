import '../../../domain/search/entities/search.dart';

enum SearchStatus { initial, loading, loaded, failure }

class SearchState {
  final SearchStatus status;
  final SearchData? data;
  final String errorMessage;

  const SearchState({
    this.status = SearchStatus.initial,
    this.data,
    this.errorMessage = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    SearchData? data,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
