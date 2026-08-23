import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';
import '../../../domain/profile/entities/watch_history_item.dart';

class HomeContinueWatching extends StatelessWidget {
  final List<WatchHistoryItem> items;

  const HomeContinueWatching({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

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
                    image: DecorationImage(
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withValues(alpha: 0.3),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_circle_outline_rounded,
                      color: AppColors.white.withValues(alpha: 0.8),
                      size: 36,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Progress bar
                Container(
                  height: 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: item.progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Details
                XText(
                  item.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                XText(
                  item.subtitle,
                  fontSize: 12,
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
