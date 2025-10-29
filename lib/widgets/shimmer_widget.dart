import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jobdi/core/themes/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.width,
    this.radius,
    this.height = 30,
  });
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final shimmer = [ShimmerEffect(duration: 1.1.seconds)];
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: shimmer,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 4),
          color: appScheme.gray200,
        ),
      ),
    );
  }
}
