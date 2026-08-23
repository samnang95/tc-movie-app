import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/sign_up/usecases/sign_up.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp _signUp;

  SignUpBloc({required this._signUp}) : super(const SignUpState()) {
    on<SignUpFullNameChanged>(_onFullNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpTogglePassword>(_onTogglePassword);
    on<SignUpToggleTerms>(_onToggleTerms);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onFullNameChanged(
    SignUpFullNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(fullName: event.fullName, errorMessage: ''));
  }

  void _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email, errorMessage: ''));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password, errorMessage: ''));
  }

  void _onTogglePassword(
    SignUpTogglePassword event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onToggleTerms(SignUpToggleTerms event, Emitter<SignUpState> emit) {
    emit(state.copyWith(agreedToTerms: !state.agreedToTerms));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.fullName.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: 'Please fill in all fields',
        ),
      );
      return;
    }

    if (!state.agreedToTerms) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: 'Please agree to the Terms of Service',
        ),
      );
      return;
    }

    emit(state.copyWith(status: SignUpStatus.loading, errorMessage: ''));

    final (failure, _) = await _signUp(
      fullName: state.fullName,
      email: state.email,
      password: state.password,
    );

    if (failure != null) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: failure.message,
        ),
      );
    } else {
      emit(state.copyWith(status: SignUpStatus.success));
    }
  }
}
