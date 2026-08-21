import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_event.dart';
import '../bloc/sign_up_state.dart';
import '../../../shared/widgets/x_button.dart';
import '../../../shared/widgets/x_scaffold.dart';
import '../../../shared/widgets/x_text.dart';
import '../../../shared/widgets/x_text_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.failure &&
              state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.primary,
              ),
            );
          }
          if (state.status == SignUpStatus.success) {
            context.go('/home');
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
                      color: AppColors.white,
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
              const SizedBox(height: 36),

              // ── Join the Cinema heading ──
              XText(
                'join_the_cinema'.getString(context),
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
              const SizedBox(height: 8),
              XText(
                'create_account_subtitle'.getString(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              const SizedBox(height: 32),

              // ── Full Name label + field ──
              XText.label('full_name'.getString(context)),
              const SizedBox(height: 10),
              XTextField(
                hintText: 'full_name_hint'.getString(context),
                prefixIcon: Icons.person_outline_rounded,
                textInputAction: TextInputAction.next,
                onChanged: (value) => context.read<SignUpBloc>().add(
                  SignUpFullNameChanged(value),
                ),
              ),
              const SizedBox(height: 20),

              // ── Email label + field ──
              XText.label('email_address'.getString(context)),
              const SizedBox(height: 10),
              XTextField(
                hintText: 'sign_up_email_hint'.getString(context),
                prefixIcon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (value) => context.read<SignUpBloc>().add(
                  SignUpEmailChanged(value),
                ),
              ),
              const SizedBox(height: 20),

              // ── Password label + field ──
              XText.label('password'.getString(context)),
              const SizedBox(height: 10),
              BlocBuilder<SignUpBloc, SignUpState>(
                buildWhen: (prev, curr) =>
                    prev.obscurePassword != curr.obscurePassword,
                builder: (context, state) {
                  return XTextField(
                    hintText: '••••••••',
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: state.obscurePassword,
                    textInputAction: TextInputAction.done,
                    suffixIcon: GestureDetector(
                      onTap: () => context.read<SignUpBloc>().add(
                        const SignUpTogglePassword(),
                      ),
                      child: Icon(
                        state.obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.white.withValues(alpha: 0.40),
                        size: 20,
                      ),
                    ),
                    onChanged: (value) => context.read<SignUpBloc>().add(
                      SignUpPasswordChanged(value),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // ── Terms checkbox ──
              BlocBuilder<SignUpBloc, SignUpState>(
                buildWhen: (prev, curr) =>
                    prev.agreedToTerms != curr.agreedToTerms,
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => context.read<SignUpBloc>().add(
                      const SignUpToggleTerms(),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                            color: state.agreedToTerms
                                ? AppColors.primary
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: state.agreedToTerms
                                  ? AppColors.primary
                                  : AppColors.white.withValues(alpha: 0.30),
                              width: 1.5,
                            ),
                          ),
                          child: state.agreedToTerms
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: AppColors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: AppFonts.sora,
                                fontSize: 13,
                                color: AppColors.white.withValues(alpha: 0.60),
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(text: 'agree_to'.getString(context)),
                                TextSpan(
                                  text: 'terms_of_service'.getString(context),
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: 'and'.getString(context)),
                                TextSpan(
                                  text: 'privacy_policy'.getString(context),
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: 'of_app'.getString(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 28),

              // ── Sign Up button ──
              BlocBuilder<SignUpBloc, SignUpState>(
                buildWhen: (prev, curr) => prev.status != curr.status,
                builder: (context, state) {
                  return XButton(
                    label: 'sign_up'.getString(context),
                    isLoading: state.status == SignUpStatus.loading,
                    onPressed: () => context.read<SignUpBloc>().add(
                      const SignUpSubmitted(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // ── Already have an account? Sign In ──
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: AppFonts.sora,
                        fontSize: 13,
                        color: AppColors.white.withValues(alpha: 0.50),
                      ),
                      children: [
                        TextSpan(text: 'already_have_account'.getString(context)),
                        TextSpan(
                          text: 'sign_in'.getString(context),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ── Premium Access banner ──
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.15),
                      AppColors.surface,
                    ],
                  ),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Stack(
                  children: [
                    // Gradient overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.transparent,
                              AppColors.background.withValues(alpha: 0.90),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Bottom label
                    Positioned(
                      left: 16,
                      bottom: 14,
                      child: Row(
                        children: [
                          Icon(
                            Icons.movie_filter_rounded,
                            color: AppColors.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          XText(
                            'premium_access'.getString(context),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            letterSpacing: 1.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
