import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/home/homepage/usecases/get_home_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData _getHomeData;

  HomeBloc({required this._getHomeData}) : super(const HomeState()) {
    on<HomeDataRequested>(_onDataRequested);

    // Auto-fetch on creation
    add(const HomeDataRequested());
  }

  Future<void> _onDataRequested(
    HomeDataRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: ''));

    final (failure, items) = await _getHomeData();

    if (failure != null) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: failure.message,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.loaded,
        items: items ?? [],
      ));
    }
  }
}
