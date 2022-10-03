import 'package:flutter/material.dart';
import 'package:habit_builder_app/navigation/route_names.dart';

import '../../../../elements/custom_button.dart';
import '../../elements/onboarding_page.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OnBoardingPage(
              title: 'JOIN A SUPPORTIVE\nCOMMUNITY',
              imagePath: 'assets/images/getStarted.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: CustomButton(
                buttonText: 'Get Started',
                height: 60,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.loginViewRoute);
                }),
          )
        ],
      ),
    );
  }
}
