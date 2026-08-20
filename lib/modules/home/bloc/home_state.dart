import '../../../domain/entities/user_entity.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState {
  final HomeStatus status;
  final List<UserEntity> users;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.users = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<UserEntity>? users,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
