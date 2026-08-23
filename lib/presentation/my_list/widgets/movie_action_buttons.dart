import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class MovieActionButtons extends StatelessWidget {
  const MovieActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Play Button ──
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: AppColors.white,
                size: 22,
              ),
              label: XText(
                'play'.getString(context),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: AppColors.primary.withValues(alpha: 0.35),
                elevation: 8,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // ── My List Button ──
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add_rounded,
                color: AppColors.white,
                size: 20,
              ),
              label: XText(
                'my_list'.getString(context),
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surface,
                side: BorderSide(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // ── Share Button ──
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: AppColors.white,
                size: 18,
              ),
              label: XText(
                'share'.getString(context),
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surface,
                side: BorderSide(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
