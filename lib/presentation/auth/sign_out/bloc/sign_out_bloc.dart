import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/sign_out/usecases/sign_out.dart';
import 'sign_out_event.dart';
import 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final SignOut _signOut;

  SignOutBloc({required this._signOut}) : super(const SignOutState()) {
    on<SignOutRequested>(_onRequested);
  }

  Future<void> _onRequested(
    SignOutRequested event,
    Emitter<SignOutState> emit,
  ) async {
    emit(state.copyWith(status: SignOutStatus.loading));

    final (failure, _) = await _signOut();

    if (failure != null) {
      emit(
        state.copyWith(
          status: SignOutStatus.failure,
          errorMessage: failure.message,
        ),
      );
    } else {
      emit(state.copyWith(status: SignOutStatus.success));
    }
  }
}
