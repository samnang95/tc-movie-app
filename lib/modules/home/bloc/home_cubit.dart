import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_users_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUsersUseCase _getUsersUseCase;

  HomeCubit({required this._getUsersUseCase})
      : super(const HomeState()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: ''));

    final response = await _getUsersUseCase();

    if (response.success && response.data != null) {
      emit(state.copyWith(
        status: HomeStatus.loaded,
        users: response.data!,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: response.message ?? 'Failed to fetch users',
      ));
    }
  }
}
