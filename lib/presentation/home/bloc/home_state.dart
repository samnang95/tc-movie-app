import '../../../domain/home/homepage/entities/home.dart';

enum HomeStatus { initial, loading, loaded, failure }

class HomeState {
  final HomeStatus status;
  final List<HomeItem> items;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.items = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<HomeItem>? items,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
