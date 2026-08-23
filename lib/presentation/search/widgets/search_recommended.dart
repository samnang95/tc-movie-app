import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../domain/my_list/entities/movie_detail.dart';
import '../../shared/widgets/x_text.dart';

class SearchRecommended extends StatelessWidget {
  final List<MovieDetail> movies;

  const SearchRecommended({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: movies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _buildRecommendedCard(context, movie);
        },
      ),
    );
  }

  Widget _buildRecommendedCard(BuildContext context, MovieDetail movie) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(movie.posterPath),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.06),
                    ),
                  ),
                ),
                // Play button overlay
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.50),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.20),
                      ),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                ),
                // Tags
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: movie.badges.map((badge) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: _buildTag(
                          badge.toUpperCase(),
                          AppColors.primary,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Title
          XText(
            movie.title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Metadata
          Row(
            children: [
              XText(
                movie.year,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Container(
                width: 3,
                height: 3,
                decoration: const BoxDecoration(
                  color: AppColors.textSecondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              XText(
                movie.duration,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: XText(
        text,
        fontSize: 9,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
        letterSpacing: 0.5,
      ),
    );
  }
}
