import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class XScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool useSafeArea;
  final Color? glowColor;

  const XScaffold({
    super.key,
    required this.body,
    this.backgroundColor = AppColors.background,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.useSafeArea = true,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = body;

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    if (glowColor != null) {
      content = Stack(
        children: [
          // ── Background gradient glow ──
          Positioned(
            top: -60,
            left: -40,
            right: -40,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.0,
                  colors: [
                    glowColor!.withValues(alpha: 0.30),
                    glowColor!.withValues(alpha: 0.08),
                    AppColors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          content,
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: content,
    );
  }
}
