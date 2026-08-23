import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class SearchTrendingChips extends StatelessWidget {
  const SearchTrendingChips({super.key});

  static const _trendingItems = [
    'Oscar Winners 2024',
    'Christopher Nolan',
    'Cyberpunk Series',
    'Anime',
    'Classic Noir',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _trendingItems
            .map((item) => _buildChip(item))
            .toList(),
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.10),
        ),
      ),
      child: XText(
        text,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    );
  }
}
