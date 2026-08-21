import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class _TrendingItem {
  final String title;
  final int rank;
  _TrendingItem(this.title, this.rank);
}

class HomeTrendingNow extends StatelessWidget {
  const HomeTrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _TrendingItem('Void Voyager', 1),
      _TrendingItem('Red District', 2),
      _TrendingItem('Velocity', 3),
      _TrendingItem('Dark Ember', 4),
    ];

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        separatorBuilder: (_, i) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poster
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.primary.withValues(alpha: 0.15),
                              AppColors.surface,
                            ],
                          ),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.06),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.movie_filter_outlined,
                            color: AppColors.primary.withValues(alpha: 0.40),
                            size: 40,
                          ),
                        ),
                      ),
                      // TOP 10 badge
                      if (item.rank <= 3)
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: XText(
                              'TOP ${item.rank}0',
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                XText(
                  item.title,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
