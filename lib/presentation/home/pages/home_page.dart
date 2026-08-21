import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../shared/widgets/x_scaffold.dart';
import '../../../core/constants/app_colors.dart';

import '../widgets/home_top_bar.dart';
import '../widgets/home_hero_banner.dart';
import '../widgets/home_section_header.dart';
import '../widgets/home_continue_watching.dart';
import '../widgets/home_trending_now.dart';
import '../widgets/home_new_releases.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.surface,
            onRefresh: () async =>
                context.read<HomeBloc>().add(const HomeDataRequested()),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Top bar ──
                  const HomeTopBar(),

                  // ── Hero Banner ──
                  const HomeHeroBanner(),

                  const SizedBox(height: 28),

                  // ── Continue Watching ──
                  HomeSectionHeader(
                    title: 'continue_watching'.getString(context),
                  ),
                  const SizedBox(height: 14),
                  const HomeContinueWatching(),

                  const SizedBox(height: 28),

                  // ── Trending Now ──
                  HomeSectionHeader(
                    title: 'trending_now'.getString(context),
                    showViewAll: true,
                  ),
                  const SizedBox(height: 14),
                  const HomeTrendingNow(),

                  const SizedBox(height: 28),

                  // ── New Releases ──
                  HomeSectionHeader(
                    title: 'new_releases'.getString(context),
                  ),
                  const SizedBox(height: 14),
                  const HomeNewReleases(),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
