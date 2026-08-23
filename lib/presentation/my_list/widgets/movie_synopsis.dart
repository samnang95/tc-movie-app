import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class MovieSynopsis extends StatelessWidget {
  final MovieDetail movie;

  const MovieSynopsis({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XText.label(
          'synopsis'.getString(context),
          color: AppColors.textSecondary,
          letterSpacing: 1.2,
        ),
        const SizedBox(height: 12),
        XText.subtitle(
          movie.synopsis,
          color: AppColors.textPrimary.withValues(alpha: 0.8),
          height: 1.6,
        ),
      ],
    );
  }
}
