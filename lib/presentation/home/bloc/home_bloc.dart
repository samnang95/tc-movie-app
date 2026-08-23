import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/home/homepage/usecases/get_home_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(const HomeState()) {
    on<HomeDataRequested>(_onHomeDataRequested);
  }

  Future<void> _onHomeDataRequested(
    HomeDataRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await getHomeData();
    final failure = result.$1;
    final data = result.$2;

    if (failure != null) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: 'Failed to load home data',
        ),
      );
    } else {
      emit(state.copyWith(status: HomeStatus.loaded, data: data));
    }
  }
}
