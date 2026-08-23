import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class HomeHeroBanner extends StatelessWidget {
  final MovieDetail movie;

  const HomeHeroBanner({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(movie.posterPath),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
            AppColors.background.withValues(alpha: 0.3),
            BlendMode.darken,
          ),
        ),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.04)),
      ),
      child: Stack(
        children: [
          // Bottom gradient for text legibility
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.transparent,
                    AppColors.background.withValues(alpha: 0.9),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Badges
                if (movie.badges.isNotEmpty)
                  Row(
                    children: movie.badges
                        .map(
                          (badge) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: _buildBadge(badge.toUpperCase()),
                          ),
                        )
                        .toList(),
                  ),
                const SizedBox(height: 14),

                // Movie Title
                XText(
                  movie.title.toUpperCase(),
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                  height: 1.0,
                  letterSpacing: -0.5,
                ),
                const SizedBox(height: 18),

                // Action buttons
                Row(
                  children: [
                    _buildActionButton(
                      context: context,
                      icon: Icons.play_arrow_rounded,
                      label: 'play'.getString(context),
                      filled: true,
                    ),
                    const SizedBox(width: 12),
                    _buildActionButton(
                      context: context,
                      icon: Icons.add,
                      label: 'my_list'.getString(context),
                      filled: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
      ),
      child: XText(
        text,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool filled,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: filled ? AppColors.primary : AppColors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: filled
              ? AppColors.primary
              : AppColors.white.withValues(alpha: 0.30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.white, size: 18),
          const SizedBox(width: 6),
          XText(
            label,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
