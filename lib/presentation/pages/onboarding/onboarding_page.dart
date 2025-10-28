import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/extensions/color_extension.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/onboarding_content.dart'
    show OnboardingContent;
import 'package:jobdi/presentation/pages/onboarding/widgets/onboarding_next_button.dart'
    show OnboardingNextButton;
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_text.dart';
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
    } else {
      await NavigatorService.goToMainPage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      top: false,
      color: Colors.transparent,
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
                        const Gap(28),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 275.w),
                          child: SemiBoldText(
                            page.title,
                            fontSize: 24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Gap(30),
                      ],
                    );
                  },
                ),
              ),

              _buildIndicator(),
              Gap(24 + MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return OnboardingNextButton(
      onPressed: _onNextPressed,
      currentPage: _currentIndex + 1,
      totalPages: _pages.length,
    );
  }
}
