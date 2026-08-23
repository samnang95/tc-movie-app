import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

import '../../../domain/profile/entities/watch_history_item.dart';

class ProfileWatchHistory extends StatelessWidget {
  final List<WatchHistoryItem> items;

  const ProfileWatchHistory({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XText(
              'watch_history'.getString(context),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            XText(
              'clear'.getString(context),
              color: AppColors.primary,
              fontSize: 14,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 145, // Height for image + text
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildHistoryItem(
                item.title,
                item.imagePath,
                item.subtitle,
                item.progress,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(
    String title,
    String image,
    String subtitle,
    double progress,
  ) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 90,
              width: 160,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(image, fit: BoxFit.cover, width: 160, height: 90),
                  // Progress Bar
                  Container(
                    height: 4,
                    width: 160,
                    color: AppColors.white.withValues(alpha: 0.3),
                  ),
                  Container(
                    height: 4,
                    width: 160 * progress,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          XText(title, fontWeight: FontWeight.bold, fontSize: 14, maxLines: 1),
          const SizedBox(height: 2),
          XText(subtitle, color: AppColors.textSecondary, fontSize: 11),
        ],
      ),
    );
  }
}
