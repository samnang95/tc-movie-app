import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

class MovieHeroAppBar extends StatelessWidget {
  final MovieDetail movie;

  const MovieHeroAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textSecondary),
        onPressed: () {},
      ),
      title: XText.label(
        'midnight_cinema'.getString(context),
        color: AppColors.primary,
        letterSpacing: 1.5,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(movie.cast.first.imagePath),
            backgroundColor: AppColors.surface,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(movie.posterPath, fit: BoxFit.cover),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.background.withValues(alpha: 0.3),
                    AppColors.background.withValues(alpha: 0.0),
                    AppColors.background.withValues(alpha: 0.8),
                    AppColors.background,
                  ],
                  stops: const [0.0, 0.3, 0.8, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
