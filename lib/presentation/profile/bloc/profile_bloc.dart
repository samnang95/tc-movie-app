import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/profile/usecases/get_profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;

  ProfileBloc(this._getProfile) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await _getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
