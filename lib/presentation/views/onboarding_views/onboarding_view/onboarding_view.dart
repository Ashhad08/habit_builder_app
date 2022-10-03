import 'package:flutter/material.dart';
import 'package:habit_builder_app/configurations/front_end.dart';

import 'layout/body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: OnBoardingViewBody(),
    );
  }
}
