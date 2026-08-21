import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/sign_in/usecases/sign_in.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignIn _signIn;

  SignInBloc({required this._signIn}) : super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInTogglePassword>(_onTogglePassword);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInWithGoogle>(_onWithGoogle);
    on<SignInWithApple>(_onWithApple);
  }

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email, errorMessage: ''));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password, errorMessage: ''));
  }

  void _onTogglePassword(
    SignInTogglePassword event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(
        status: SignInStatus.failure,
        errorMessage: 'Please fill in all fields',
      ));
      return;
    }

    emit(state.copyWith(status: SignInStatus.loading, errorMessage: ''));

    final (failure, _) = await _signIn(
      email: state.email,
      password: state.password,
    );

    if (failure != null) {
      emit(state.copyWith(
        status: SignInStatus.failure,
        errorMessage: failure.message,
      ));
    } else {
      emit(state.copyWith(status: SignInStatus.success));
    }
  }

  Future<void> _onWithGoogle(
    SignInWithGoogle event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading, errorMessage: ''));

    // todo: Implement Google sign-in
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: SignInStatus.initial));
  }

  Future<void> _onWithApple(
    SignInWithApple event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading, errorMessage: ''));

    // todo: Implement Apple sign-in
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: SignInStatus.initial));
  }
}
