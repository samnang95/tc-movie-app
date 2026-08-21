import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class _ContinueItem {
  final String title;
  final String remaining;
  final double progress;
  _ContinueItem(this.title, this.remaining, this.progress);
}

class HomeContinueWatching extends StatelessWidget {
  const HomeContinueWatching({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ContinueItem('Shadow Protocol: Ep 4', '32m remaining', 0.65),
      _ContinueItem('The Last Silence', '1h 14m remaining', 0.30),
      _ContinueItem('Crimson Tide', '45m remaining', 0.50),
    ];

    return SizedBox(
      height: 180,
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
                // Thumbnail
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.surface,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.tertiary, AppColors.surface],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_circle_outline_rounded,
                      color: AppColors.white.withValues(alpha: 0.30),
                      size: 36,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: item.progress,
                    backgroundColor: AppColors.white.withValues(alpha: 0.10),
                    color: AppColors.primary,
                    minHeight: 3,
                  ),
                ),
                const SizedBox(height: 6),

                // Title
                XText(
                  item.title,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),

                // Remaining
                XText(
                  item.remaining,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
