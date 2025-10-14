import 'dart:math' show pi;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;

class OnboardingNextButton extends StatefulWidget {
  const OnboardingNextButton({
    required this.currentPage,
    required this.totalPages,
    required this.onPressed,
    super.key,
  });
  final int currentPage;
  final int totalPages;
  final VoidCallback onPressed;

  @override
  State<OnboardingNextButton> createState() => _OnboardingNextButtonState();
}

class _OnboardingNextButtonState extends State<OnboardingNextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late int _oldPage;

  @override
  void initState() {
    super.initState();
    _oldPage = widget.currentPage;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(covariant OnboardingNextButton oldWidget)  {
    super.didUpdateWidget(oldWidget);
    if (widget.currentPage != oldWidget.currentPage) {
      _oldPage = oldWidget.currentPage;
       _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,

      builder: (context, _) {
        final interpolated = lerpDouble(
          _oldPage.toDouble(),
          widget.currentPage.toDouble(),
          _animation.value,
        )!;
        return CustomPaint(
          painter: _SegmentedCirclePainter(
            totalSegments: widget.totalPages,
            activeSegments: interpolated,
          ),
          child: InkWell(
            onTap: widget.onPressed,
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.currentPage == widget.totalPages
                    ? appScheme.primaryColor
                    : appScheme.black,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SegmentedCirclePainter extends CustomPainter {
  _SegmentedCirclePainter({
    required this.totalSegments,
    required this.activeSegments,
  });
  final int totalSegments;
  final double activeSegments;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;
    const gap = 0.25;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) + 8;
    final segmentAngle = (2 * pi - (gap * totalSegments)) / totalSegments;

    final bgPaint = Paint()
      ..color = appScheme.gray200
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var startAngle = -pi / 2;

    for (var i = 0; i < totalSegments; i++) {
      final segmentProgress = (activeSegments - i).clamp(0.0, 1.0);

      var paint = bgPaint;
      if (segmentProgress > 0) {
        paint = Paint()
          ..color = Color.lerp(
            appScheme.gray200,
            appScheme.primaryColor,
            segmentProgress,
          )!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;
      }
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        false,
        paint,
      );
      startAngle += segmentAngle + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
