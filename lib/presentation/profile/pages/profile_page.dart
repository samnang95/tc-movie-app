import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_scaffold.dart';
import '../../shared/widgets/x_text.dart';
import '../../shared/widgets/x_button.dart';
import '../../auth/sign_out/bloc/sign_out_bloc.dart';
import '../../auth/sign_out/bloc/sign_out_event.dart';
import '../../auth/sign_out/bloc/sign_out_state.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              XText(
                'nav_profile'.getString(context),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              const SizedBox(height: 32),
              XButton(
                onPressed: () =>
                    context.read<SignOutBloc>().add(const SignOutRequested()),
                label: 'sign_out'.getString(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
