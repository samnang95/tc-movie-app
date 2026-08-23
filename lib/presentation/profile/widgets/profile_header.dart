import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

import '../../../domain/profile/entities/profile.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4), // gradient border width
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profile.avatarPath),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, size: 16, color: AppColors.white),
            ),
          ],
        ),
        const SizedBox(height: 20),
        XText(
          profile.name,
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
        const SizedBox(height: 6),
        if (profile.isPremium)
          XText(
            'premium_member'.getString(context).toUpperCase(),
            fontSize: 12,
            color: AppColors.primary.withValues(alpha: 0.9),
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
      ],
    );
  }
}
