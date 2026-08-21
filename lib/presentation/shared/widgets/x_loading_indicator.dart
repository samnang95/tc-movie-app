import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class XLoadingIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const XLoadingIndicator({
    super.key,
    this.size = 36,
    this.strokeWidth = 3.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}
