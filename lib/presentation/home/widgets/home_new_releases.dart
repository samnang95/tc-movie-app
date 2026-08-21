import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class _ReleaseItem {
  final String title;
  final bool isOriginal;
  _ReleaseItem(this.title, this.isOriginal);
}

class HomeNewReleases extends StatelessWidget {
  const HomeNewReleases({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ReleaseItem('Infinite Harmony', true),
      _ReleaseItem('Midnight Run', false),
      _ReleaseItem('Chrome Hearts', false),
      _ReleaseItem('Neon Shadows', true),
    ];

    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        separatorBuilder: (_, i) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: 150,
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
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withValues(alpha: 0.10),
                              AppColors.tertiary,
                            ],
                          ),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.06),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.theaters_rounded,
                            color: AppColors.primary.withValues(alpha: 0.30),
                            size: 40,
                          ),
                        ),
                      ),
                      // ORIGINAL SERIES badge
                      if (item.isOriginal)
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.90),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: XText(
                              'original_series'.getString(context),
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
