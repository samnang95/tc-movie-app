import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class SearchTrendingChips extends StatelessWidget {
  final List<String> trends;

  const SearchTrendingChips({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: trends.map((item) => _buildChip(item)).toList(),
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.10)),
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
