import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_event.dart';
import '../bloc/sign_in_state.dart';
import '../../../shared/widgets/x_button.dart';
import '../../../shared/widgets/x_divider.dart';
import '../../../shared/widgets/x_scaffold.dart';
import '../../../shared/widgets/x_social_button.dart';
import '../../../shared/widgets/x_text.dart';
import '../../../shared/widgets/x_text_field.dart';
import '../../../../core/constants/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      glowColor: AppColors.primary,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status == SignInStatus.failure &&
              state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.primary,
              ),
            );
          }
          if (state.status == SignInStatus.success) {
            context.go('/home');
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // ── Logo icon ──
              const Icon(
                Icons.movie_filter_outlined,
                color: AppColors.primary,
                size: 48,
              ),
              const SizedBox(height: 12),

              // ── App name ──
              XText(
                'app_name'.getString(context),
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                letterSpacing: 2.0,
              ),
              const SizedBox(height: 36),

              // ── Sign-in card ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Welcome text ──
                    Center(child: XText.heading('welcome_back'.getString(context))),
                    const SizedBox(height: 6),
                    Center(
                      child: XText.subtitle(
                        'enter_details'.getString(context),
                        color: AppColors.white.withValues(alpha: 0.50),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // ── Email label ──
                    XText.label('email_address'.getString(context)),
                    const SizedBox(height: 10),

                    // ── Email field ──
                    XTextField(
                      hintText: 'email_hint'.getString(context),
                      prefixIcon: Icons.mail_outline_rounded,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        debugPrint('Email changed: $value');
                        context.read<SignInBloc>().add(
                          SignInEmailChanged(value),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Password label + Forgot password ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        XText.label('password'.getString(context)),
                        GestureDetector(
                          onTap: () {
                            // todo: Navigate to forgot password
                          },
                          child: XText(
                            'forgot_password'.getString(context),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // ── Password field ──
                    BlocBuilder<SignInBloc, SignInState>(
                      buildWhen: (prev, curr) =>
                          prev.obscurePassword != curr.obscurePassword,
                      builder: (context, state) {
                        return XTextField(
                          hintText: '••••••••',
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: state.obscurePassword,
                          textInputAction: TextInputAction.done,
                          suffixIcon: GestureDetector(
                            onTap: () => context.read<SignInBloc>().add(
                              const SignInTogglePassword(),
                            ),
                            child: Icon(
                              state.obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.white.withValues(alpha: 0.40),
                              size: 20,
                            ),
                          ),
                          onChanged: (value) => context.read<SignInBloc>().add(
                            SignInPasswordChanged(value),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 28),

                    // ── Sign In button ──
                    BlocBuilder<SignInBloc, SignInState>(
                      buildWhen: (prev, curr) => prev.status != curr.status,
                      builder: (context, state) {
                        return XButton(
                          label: 'sign_in'.getString(context),
                          isLoading: state.status == SignInStatus.loading,
                          onPressed: () => context.read<SignInBloc>().add(
                            const SignInSubmitted(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // ── OR CONTINUE WITH divider ──
                    XDivider(text: 'or_continue_with'.getString(context)),
                    const SizedBox(height: 20),

                    // ── Google & Apple buttons ──
                    Row(
                      children: [
                        Expanded(
                          child: XSocialButton(
                            label: 'google'.getString(context),
                            onTap: () => context.read<SignInBloc>().add(
                              const SignInWithGoogle(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: XSocialButton(
                            label: 'apple'.getString(context),
                            onTap: () => context.read<SignInBloc>().add(
                              const SignInWithApple(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── Create Account link ──
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // todo: Navigate to sign-up page
                          debugPrint("Create Account");
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: AppColors.white.withValues(alpha: 0.50),
                            ),
                            children: [
                              TextSpan(text: 'new_to_app'.getString(context)),
                              TextSpan(
                                text: 'create_account'.getString(context),
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // ── Footer ──
              XText(
                'rights_reserved'.getString(context),
                textAlign: TextAlign.center,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withValues(alpha: 0.25),
                letterSpacing: 1.0,
                height: 1.6,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
