import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_scaffold.dart';
import '../../shared/widgets/x_text.dart';
import '../../auth/sign_out/bloc/sign_out_bloc.dart';
import '../../auth/sign_out/bloc/sign_out_event.dart';
import '../../auth/sign_out/bloc/sign_out_state.dart';

import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_my_list.dart';
import '../widgets/profile_watch_history.dart';
import '../widgets/profile_settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutBloc, SignOutState>(
      listener: (context, state) {
        if (state.status == SignOutStatus.success) {
          context.go('/sign-in');
        }
      },
      child: XScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textSecondary),
            onPressed: () {},
          ),
          title: XText.label(
            'midnight_cinema'.getString(context),
            color: AppColors.primary,
            letterSpacing: 1.5,
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                  'assets/images/cast_james_1787453191643.jpg',
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading || state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }

            if (state is ProfileLoaded) {
              final profile = state.profile;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      ProfileHeader(profile: profile),
                      const SizedBox(height: 32),
                      ProfileMyList(movies: profile.myList),
                      const SizedBox(height: 32),
                      ProfileWatchHistory(items: profile.watchHistory),
                      const SizedBox(height: 32),
                      ProfileSettings(
                        onSignOut: () {
                          context.read<SignOutBloc>().add(
                            const SignOutRequested(),
                          );
                        },
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
