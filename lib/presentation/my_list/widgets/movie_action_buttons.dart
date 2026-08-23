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
        Expanded(
          child: SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, color: AppColors.white),
              label: XText(
                'play'.getString(context),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: AppColors.primary.withValues(alpha: 0.35),
                elevation: 10,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        _buildIconButton(Icons.add),
        const SizedBox(width: 12),
        _buildIconButton(Icons.share_outlined),
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.white),
        onPressed: () {},
      ),
    );
  }
}
