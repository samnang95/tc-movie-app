import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  final bool showViewAll;

  const HomeSectionHeader({
    super.key,
    required this.title,
    this.showViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          XText(
            title,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
          if (showViewAll)
            XText(
              'view_all'.getString(context),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }
}
