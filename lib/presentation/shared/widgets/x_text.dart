import 'package:flutter/material.dart';

import '../../../core/constants/app_fonts.dart';

class XText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const XText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
  });

  /// Heading style — 24px, bold
  const XText.heading(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : fontSize = 24,
       fontWeight = FontWeight.w700;

  /// Subheading style — 14px, regular, muted
  const XText.subtitle(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : fontSize = 14,
       fontWeight = FontWeight.w400;

  /// Label style — 14px, semi-bold
  const XText.label(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : fontSize = 14,
       fontWeight = FontWeight.w600;

  /// Caption style — 11px, semi-bold, tracking
  const XText.caption(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : fontSize = 11,
       fontWeight = FontWeight.w600,
       letterSpacing = 1.2;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: AppFonts.sora,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
