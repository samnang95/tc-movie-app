import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class MovieBadges extends StatelessWidget {
  final MovieDetail movie;

  const MovieBadges({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: movie.badges.map((badge) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: _buildPill(badge),
        );
      }).toList(),
    );
  }

  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
      ),
      child: XText.caption(text, color: AppColors.textSecondary),
    );
  }
}
