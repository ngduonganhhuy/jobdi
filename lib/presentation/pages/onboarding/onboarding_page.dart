import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:jobdi/core/extensions/color_extension.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/onboarding_content.dart'
    show OnboardingContent;
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/gap.dart';

class OnboardingPage extends StatefulWidget implements BasePage {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();

  @override
  String get screenName => 'OnboardingPage';
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingContent> _pages = const [
    OnboardingContent(
      image: PNGAsset.onboarding1,
      title: 'Tìm người làm việc quanh bạn trong vòng vài phút',
    ),
    OnboardingContent(
      image: PNGAsset.onboarding2,
      title: 'Tạo việc dễ dàng, thuê nhanh chóng',
    ),
    OnboardingContent(
      image: PNGAsset.onboarding3,
      title: 'An Toàn - Minh bạch - Tiện lợi',
    ),
  ];

  Future<void> _onNextPressed() async {
    if (_currentIndex < _pages.length - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor.fromHex('#FEB9C8'),
                Colors.white.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page.image,
                          fit: BoxFit.cover,
                        ),
                        const Gap(30),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildIndicator(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return OnboardingNextButton(
      onPressed: () {},
      currentPage: 2,
      totalPages: 3,
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SegmentedCirclePainter(
        totalSegments: totalPages,
        activeSegments: currentPage,
      ),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}

class _SegmentedCirclePainter extends CustomPainter {
  _SegmentedCirclePainter({
    required this.totalSegments,
    required this.activeSegments,
  });
  final int totalSegments;
  final int activeSegments;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 8.0;
    const gap = 0.25;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) + 10;
    final segmentAngle = (2 * pi - (gap * totalSegments)) / totalSegments;

    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..color = Colors.pinkAccent
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var startAngle = -pi / 2;

    for (var i = 0; i < totalSegments; i++) {
      final paint = i < activeSegments ? fgPaint : bgPaint;
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
