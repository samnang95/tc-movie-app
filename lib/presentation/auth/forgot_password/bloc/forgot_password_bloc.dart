import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/forgot_password/usecases/forgot_password.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPassword _forgotPassword;

  ForgotPasswordBloc({required this._forgotPassword})
      : super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email, errorMessage: ''));
  }

  Future<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (state.email.isEmpty) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.failure,
        errorMessage: 'Please enter your email address',
      ));
      return;
    }

    emit(state.copyWith(status: ForgotPasswordStatus.loading, errorMessage: ''));

    final (failure, result) = await _forgotPassword(email: state.email);

    if (failure != null) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.failure,
        errorMessage: failure.message,
      ));
    } else {
      emit(state.copyWith(
        status: ForgotPasswordStatus.success,
        successMessage: result?.message ?? 'Reset link sent successfully',
      ));
    }
  }
}
