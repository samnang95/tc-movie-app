import '../../../domain/my_list/entities/movie_detail.dart';

abstract class MyListState {}

class MyListInitial extends MyListState {}

class MyListLoading extends MyListState {}

class MyListLoaded extends MyListState {
  final MovieDetail movie;
  MyListLoaded(this.movie);
}

class MyListError extends MyListState {
  final String message;
  MyListError(this.message);
}
