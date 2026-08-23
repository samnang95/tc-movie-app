import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

import '../../../domain/my_list/entities/movie_detail.dart';

class ProfileMyList extends StatelessWidget {
  final List<MovieDetail> movies;

  const ProfileMyList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XText(
              'my_list'.getString(context),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            XText(
              'edit'.getString(context),
              color: AppColors.primary,
              fontSize: 14,
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...movies.map(
          (movie) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildListItem(
              movie.title,
              movie.posterPath,
              movie.synopsis, // We mapped genre/duration into synopsis
              movie.rating.toString(),
              movie.badges.isNotEmpty ? movie.badges.first : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(
    String title,
    String image,
    String subtitle,
    String rating,
    String? badge,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 70,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(image, fit: BoxFit.cover),
                  if (badge != null)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: XText(
                          badge,
                          fontSize: 8,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText(title, fontWeight: FontWeight.bold, fontSize: 16),
                const SizedBox(height: 4),
                XText(subtitle, color: AppColors.textSecondary, fontSize: 13),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.primary, size: 14),
                    const SizedBox(width: 4),
                    XText(rating, fontSize: 13, fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
          ),
          // Play Button
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
