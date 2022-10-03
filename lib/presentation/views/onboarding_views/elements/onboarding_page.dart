import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Column(
        children: [
          FittedBox(
            child: CustomText(
              text: title,
              fontSize: 32,
              align: TextAlign.center,
              fontWeight: FontWeight.w400,
              fontFamily: 'Klasik',
            ),
          ),
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                const TextSpan(
                  text: 'WE CAN ',
                  style: FrontEndConfigs.kTextStyle,
                ),
                TextSpan(
                  text: 'HELP YOU ',
                  style: FrontEndConfigs.kTextStyle
                      .copyWith(color: FrontEndConfigs.kPrimaryColor),
                ),
                const TextSpan(
                  text: 'TO BE A BETTER\n',
                  style: FrontEndConfigs.kTextStyle,
                ),
                const TextSpan(
                  text: 'VERSION OF ',
                  style: FrontEndConfigs.kTextStyle,
                ),
                TextSpan(
                  text: 'YOURSELF',
                  style: FrontEndConfigs.kTextStyle
                      .copyWith(color: FrontEndConfigs.kPrimaryColor),
                ),
              ]))
        ],
      ),
    );
  }
}
