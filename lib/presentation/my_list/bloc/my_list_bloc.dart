import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/my_list/usecases/get_my_list_movie.dart';
import 'my_list_event.dart';
import 'my_list_state.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  final GetMyListMovie _getMyListMovie;

  MyListBloc(this._getMyListMovie) : super(MyListInitial()) {
    on<LoadMyListMovieEvent>(_onLoadMyListMovie);
  }

  Future<void> _onLoadMyListMovie(
    LoadMyListMovieEvent event,
    Emitter<MyListState> emit,
  ) async {
    emit(MyListLoading());
    try {
      final movie = await _getMyListMovie();
      emit(MyListLoaded(movie));
    } catch (e) {
      emit(MyListError(e.toString()));
    }
  }
}
