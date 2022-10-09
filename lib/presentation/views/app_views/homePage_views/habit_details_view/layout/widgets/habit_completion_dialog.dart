import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../../navigation/route_names.dart';
import '../../../../../../elements/custom_button.dart';
import '../../../../../../elements/custom_icon_button.dart';
import '../../../../../../elements/custom_text.dart';

class HabitCompletionDialog extends StatelessWidget {
  const HabitCompletionDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: FrontEndConfigs.kWhiteColor,
      child: Container(
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomIconButton(
                  size: 36,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.close),
            ),
            Image.asset(
              'assets/images/habit.png',
              scale: 2,
            ),
            const CustomText(
              text: 'Congratulations!',
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Klasik',
            ),
            FittedBox(
              child: CustomText(
                text:
                    'Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris',
                fontSize: 16,
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonText: 'Create New Habit',
                height: 50,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.createNewHabitViewRoute);
                }),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
                buttonText: 'Continue',
                height: 50,
                backGroundColor: FrontEndConfigs.kScaffoldBGColor,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.bottomBarViewRoute);
                }),
          ],
        ),
      ),
    );
  }
}
