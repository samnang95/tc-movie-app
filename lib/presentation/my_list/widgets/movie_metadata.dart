import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class MovieMetadata extends StatelessWidget {
  final MovieDetail movie;

  const MovieMetadata({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XText.label(movie.year, color: AppColors.textSecondary),
        const SizedBox(width: 16),
        const Icon(Icons.star, color: AppColors.primary, size: 16),
        const SizedBox(width: 4),
        XText.label(movie.rating.toString(), color: AppColors.white),
        const SizedBox(width: 16),
        XText.label(movie.duration, color: AppColors.textSecondary),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textSecondary),
            borderRadius: BorderRadius.circular(4),
          ),
          child: XText(
            movie.ageRating,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
