import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          style: const TextStyle(
            fontFamily: AppFonts.sora,
            color: AppColors.white,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: 'search_hint'.getString(context),
            hintStyle: TextStyle(
              fontFamily: AppFonts.sora,
              color: AppColors.white.withValues(alpha: 0.35),
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.white.withValues(alpha: 0.40),
              size: 22,
            ),
            filled: true,
            fillColor: AppColors.transparent,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
