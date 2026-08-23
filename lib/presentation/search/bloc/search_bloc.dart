import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/search/usecases/get_recommended.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetRecommended _getRecommended;

  SearchBloc({required GetRecommended getRecommended})
      : _getRecommended = getRecommended, // ignore: prefer_initializing_formals
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

    final (failure, items) = await _getRecommended();

    if (failure != null) {
      emit(state.copyWith(
        status: SearchStatus.failure,
        errorMessage: failure.message,
      ));
    } else {
      emit(state.copyWith(
        status: SearchStatus.loaded,
        recommended: items ?? [],
      ));
    }
  }
}
