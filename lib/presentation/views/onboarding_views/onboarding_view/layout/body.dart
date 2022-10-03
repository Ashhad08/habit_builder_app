import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../../navigation/route_names.dart';
import '../../../../elements/custom_text.dart';
import '../../elements/onboarding_page.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({Key? key}) : super(key: key);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        children: const [
          OnBoardingPage(
              title: 'WELCOME TO\nMonumental habits',
              imagePath: 'assets/images/onboarding1.png'),
          OnBoardingPage(
              title: 'CREATE NEW\nHABIT EASILY',
              imagePath: 'assets/images/onboarding2.png'),
          OnBoardingPage(
              title: "KEEP TRACK OF YOUR\nPROGRESS",
              imagePath: 'assets/images/onboarding3.png'),
        ],
      ),
      Container(
        alignment: const Alignment(0, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                _pageController.jumpToPage(2);
              },
              child: const CustomText(
                text: 'Skip',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: FrontEndConfigs.kSecondaryColor,
                dotColor: FrontEndConfigs.kPrimaryColor,
                dotHeight: 13,
                dotWidth: 13,
              ),
            ),
            GestureDetector(
              onTap: () {
                _pageController.page == 2
                    ? Navigator.pushNamed(
                        context, RouteNames.getStartedViewRoute)
                    : _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
              },
              child: const CustomText(
                text: 'Next',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
