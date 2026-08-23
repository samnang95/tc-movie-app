import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/x_text.dart';

class ProfileSettings extends StatelessWidget {
  final VoidCallback onSignOut;

  const ProfileSettings({super.key, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XText(
          'settings'.getString(context),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildSettingItem(
                context,
                Icons.person_outline,
                'account_information'.getString(context),
              ),
              const Divider(color: AppColors.background, height: 1),
              _buildSettingItem(
                context,
                Icons.notifications_none,
                'notifications'.getString(context),
              ),
              const Divider(color: AppColors.background, height: 1),
              _buildSettingItem(
                context,
                Icons.download_outlined,
                'downloads'.getString(context),
              ),
              const Divider(color: AppColors.background, height: 1),
              _buildSettingItem(
                context,
                Icons.security,
                'privacy_security'.getString(context),
              ),
              const Divider(color: AppColors.background, height: 1),
              _buildSettingItem(
                context,
                Icons.logout,
                'sign_out'.getString(context),
                isDestructive: true,
                onTap: onSignOut,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    final color = isDestructive ? AppColors.primary : AppColors.textPrimary;

    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: XText(
                title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
