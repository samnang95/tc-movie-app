import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/forgot_password_bloc.dart';
import '../bloc/forgot_password_event.dart';
import '../bloc/forgot_password_state.dart';
import '../../../shared/widgets/x_button.dart';
import '../../../shared/widgets/x_scaffold.dart';
import '../../../shared/widgets/x_text.dart';
import '../../../shared/widgets/x_text_field.dart';
import '../../../../core/constants/app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      glowColor: AppColors.primary,
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.failure &&
              state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.primary,
              ),
            );
          }
          if (state.status == ForgotPasswordStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage),
                backgroundColor: const Color(0xFF10B981),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // ── Header: back arrow + app name ──
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: XText(
                        'app_name'.getString(context),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 80),

              // ── Forgot Password heading ──
              Center(
                child: XText(
                  'forgot_password_title'.getString(context),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: XText(
                  'forgot_password_subtitle'.getString(context),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // ── Email card ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: AppColors.tertiary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Email label ──
                    XText.label('email_address'.getString(context)),
                    const SizedBox(height: 10),

                    // ── Email field ──
                    XTextField(
                      hintText: 'forgot_email_hint'.getString(context),
                      prefixIcon: Icons.mail_outline_rounded,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) =>
                          context.read<ForgotPasswordBloc>().add(
                            ForgotPasswordEmailChanged(value),
                          ),
                    ),
                    const SizedBox(height: 24),

                    // ── Send Link button ──
                    BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      buildWhen: (prev, curr) => prev.status != curr.status,
                      builder: (context, state) {
                        return XButton(
                          label: 'send_link'.getString(context),
                          isLoading:
                              state.status == ForgotPasswordStatus.loading,
                          onPressed: () =>
                              context.read<ForgotPasswordBloc>().add(
                                const ForgotPasswordSubmitted(),
                              ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // ── Return to Login link ──
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: XText(
                    'return_to_login'.getString(context),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
