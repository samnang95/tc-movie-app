import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// 
/// Uses a modern, premium color scheme (based on Tailwind's Slate and Blue palettes).
abstract class AppColors {
  AppColors._();

  // ── Brand Colors ──────────────────────────────────────────────────────

  static const Color primary = Color(0xFF2563EB); // Blue 600
  static const Color primaryLight = Color(0xFF60A5FA); // Blue 400
  static const Color primaryDark = Color(0xFF1D4ED8); // Blue 700

  static const Color secondary = Color(0xFF10B981); // Emerald 500
  static const Color secondaryLight = Color(0xFF34D399); // Emerald 400
  static const Color secondaryDark = Color(0xFF047857); // Emerald 700

  // ── Background & Surface Colors (Light Mode) ──────────────────────────

  static const Color backgroundLight = Color(0xFFF8FAFC); // Slate 50
  static const Color surfaceLight = Colors.white;
  
  // ── Background & Surface Colors (Dark Mode) ───────────────────────────

  static const Color backgroundDark = Color(0xFF0F172A); // Slate 900
  static const Color surfaceDark = Color(0xFF1E293B); // Slate 800

  // ── Text Colors ───────────────────────────────────────────────────────

  static const Color textPrimaryLight = Color(0xFF0F172A); // Slate 900
  static const Color textSecondaryLight = Color(0xFF64748B); // Slate 500
  
  static const Color textPrimaryDark = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondaryDark = Color(0xFF94A3B8); // Slate 400

  // ── Semantic / Status Colors ──────────────────────────────────────────

  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color error = Color(0xFFEF4444);   // Red 500
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color info = Color(0xFF3B82F6);    // Blue 500
}
