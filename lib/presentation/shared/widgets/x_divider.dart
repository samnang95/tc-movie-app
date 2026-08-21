import 'package:flutter/material.dart';

import '../../../core/constants/app_fonts.dart';
import '../../../core/constants/app_colors.dart';

class XDivider extends StatelessWidget {
  final String text;
  final Color? lineColor;
  final Color? textColor;

  const XDivider({
    super.key,
    required this.text,
    this.lineColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedLineColor =
        lineColor ?? AppColors.white.withValues(alpha: 0.10);
    final resolvedTextColor =
        textColor ?? AppColors.white.withValues(alpha: 0.35);

    return Row(
      children: [
        Expanded(
          child: Divider(color: resolvedLineColor, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppFonts.sora,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: resolvedTextColor,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: resolvedLineColor, thickness: 1),
        ),
      ],
    );
  }
}
