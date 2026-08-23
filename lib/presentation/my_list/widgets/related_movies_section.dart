import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class RelatedMoviesSection extends StatelessWidget {
  final MovieDetail movie;

  const RelatedMoviesSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XText.label(
          'related_movies'.getString(context),
          color: AppColors.textSecondary,
          letterSpacing: 1.2,
        ),
        const SizedBox(height: 16),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: movie.relatedMovies.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(movie.relatedMovies[index], fit: BoxFit.cover),
            );
          },
        ),
      ],
    );
  }
}
