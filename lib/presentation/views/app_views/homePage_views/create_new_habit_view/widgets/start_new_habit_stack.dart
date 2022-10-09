import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';

class StartNewHabitStack extends StatelessWidget {
  const StartNewHabitStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 185,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: FrontEndConfigs.kWhiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomText(
                    text: 'Start this habit',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Klasik',
                  ),
                  CustomText(
                    text:
                        'ullamco laboris nisi ut aliquip ex ea\ncommodo consequat dolore. ',
                    fontSize: 14,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'assets/images/arrow_down_Icon.png',
                    height: 25,
                    width: 19,
                  )
                ],
              ),
            ),
          ),
          const CircleAvatar(
            backgroundColor: FrontEndConfigs.kWhiteColor,
            radius: 35,
            backgroundImage: AssetImage('assets/images/user_minimal.png'),
          ),
        ],
      ),
    );
  }
}
