import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class MovieCastSection extends StatelessWidget {
  final MovieDetail movie;

  const MovieCastSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XText.label(
              'cast'.getString(context),
              color: AppColors.textSecondary,
              letterSpacing: 1.2,
            ),
            XText.caption(
              'see_all'.getString(context),
              color: AppColors.white.withValues(alpha: 0.6),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movie.cast.length,
            separatorBuilder: (context, index) => const SizedBox(width: 24),
            itemBuilder: (context, index) {
              final castMember = movie.cast[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(castMember.imagePath),
                    backgroundColor: AppColors.surface,
                  ),
                  const SizedBox(height: 12),
                  XText(
                    castMember.name,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
