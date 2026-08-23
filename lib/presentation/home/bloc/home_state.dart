import '../../../domain/home/homepage/entities/home.dart';

enum HomeStatus { initial, loading, loaded, failure }

class HomeState {
  final HomeStatus status;
  final HomeData? data;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.data,
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    HomeData? data,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
