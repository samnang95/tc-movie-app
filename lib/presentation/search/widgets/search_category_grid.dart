import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class _CategoryItem {
  final String labelKey;
  final IconData icon;
  final List<Color> gradientColors;

  const _CategoryItem({
    required this.labelKey,
    required this.icon,
    required this.gradientColors,
  });
}

class SearchCategoryGrid extends StatelessWidget {
  const SearchCategoryGrid({super.key});

  static const _categories = [
    _CategoryItem(
      labelKey: 'category_action',
      icon: Icons.local_fire_department_rounded,
      gradientColors: [Color(0xFFFF6B35), Color(0xFF8B2500)],
    ),
    _CategoryItem(
      labelKey: 'category_comedy',
      icon: Icons.theater_comedy_rounded,
      gradientColors: [Color(0xFFCC3333), Color(0xFF5C1010)],
    ),
    _CategoryItem(
      labelKey: 'category_horror',
      icon: Icons.nightlight_round,
      gradientColors: [Color(0xFF2E4057), Color(0xFF0A1628)],
    ),
    _CategoryItem(
      labelKey: 'category_sci_fi',
      icon: Icons.blur_on_rounded,
      gradientColors: [Color(0xFF6B3FA0), Color(0xFF1A0A3E)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.6,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return _buildCategoryCard(context, cat);
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, _CategoryItem category) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: category.gradientColors,
        ),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            color: category.gradientColors.first.withValues(alpha: 0.20),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background icon (faded)
          Positioned(
            right: -8,
            top: -8,
            child: Icon(
              category.icon,
              size: 72,
              color: AppColors.white.withValues(alpha: 0.08),
            ),
          ),
          // Label
          Positioned(
            left: 14,
            bottom: 14,
            child: XText(
              category.labelKey.getString(context),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
