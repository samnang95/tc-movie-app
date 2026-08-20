import 'package:flutter/material.dart';

class XLoading extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final String? message;

  const XLoading({
    super.key,
    this.size = 36,
    this.strokeWidth = 3,
    this.color,
    this.message,
  });

  /// Full-screen loading overlay.
  const XLoading.fullScreen({
    super.key,
    this.size = 48,
    this.strokeWidth = 3,
    this.color,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final indicator = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );

    if (message != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          const SizedBox(height: 16),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );
    }

    return Center(child: indicator);
  }
}
