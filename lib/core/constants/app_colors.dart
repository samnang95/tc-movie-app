import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // ── Brand Colors ──────────────────────────────────────────────────────
  static const Color primary = Color(0xFFFF003C);
  static const Color secondary = Color(0xFF121212);
  static const Color tertiary = Color(0xFF1A1A1A);
  static const Color neutral = Color(0xFFE5E5E5);

  //common colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // ── Background & Surface Colors ───────────────────────────────────────
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF121212);

  // ── Text Colors ───────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFE5E5E5);
  static const Color textSecondary = Color(0xFF94A3B8);
}
