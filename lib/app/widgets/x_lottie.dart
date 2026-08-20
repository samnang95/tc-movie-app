import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class XLottie extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool repeat;
  final bool animate;
  final void Function(LottieComposition)? onLoaded;

  const XLottie(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.repeat = true,
    this.animate = true,
    this.onLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
      animate: animate,
      onLoaded: onLoaded,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: width ?? 50,
          height: height ?? 50,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        );
      },
    );
  }
}
