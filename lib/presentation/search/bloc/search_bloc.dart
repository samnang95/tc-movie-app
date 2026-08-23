import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/search/usecases/get_search_data.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchData _getSearchData;

  SearchBloc({required GetSearchData getSearchData})
    : _getSearchData = getSearchData, // ignore: prefer_initializing_formals
      super(const SearchState()) {
    on<SearchDataRequested>(_onDataRequested);
    // Auto-fetch on creation
    add(const SearchDataRequested());
  }

  Future<void> _onDataRequested(
    SearchDataRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: SearchStatus.loading, errorMessage: ''));

    final result = await _getSearchData();
    final failure = result.$1;
    final data = result.$2;

    if (failure != null) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
          errorMessage: 'Failed to load search data',
        ),
      );
    } else {
      emit(state.copyWith(status: SearchStatus.loaded, data: data));
    }
  }
}
