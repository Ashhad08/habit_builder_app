import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';
import '../../../../../auth_views/signup_view/layout/widgets/checkbox_tile.dart';

class UnlockFeatures extends StatefulWidget {
  const UnlockFeatures({
    Key? key,
  }) : super(key: key);

  @override
  State<UnlockFeatures> createState() => _UnlockFeaturesState();
}

class _UnlockFeaturesState extends State<UnlockFeatures> {
  bool unlimitedHabits = false;
  bool accessToCourses = false;
  bool accessToAvatars = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: FrontEndConfigs.kWhiteColor),
      child: Column(
        children: [
          const CustomText(
              text: 'Unlock Monumental Habits',
              fontSize: 20,
              fontWeight: FontWeight.w700),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            height: 0,
            thickness: 1,
          ),
          CheckBoxTile(
              checkBoxValue: unlimitedHabits,
              onChanged: (val) {
                setState(() {
                  unlimitedHabits = val;
                });
              },
              isRound: true,
              title: 'Unlimited habits'),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            height: 0,
            thickness: 1,
          ),
          CheckBoxTile(
              checkBoxValue: accessToCourses,
              onChanged: (val) {
                setState(() {
                  accessToCourses = val;
                });
              },
              isRound: true,
              title: 'Access to all courses'),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            height: 0,
            thickness: 1,
          ),
          CheckBoxTile(
              checkBoxValue: accessToAvatars,
              onChanged: (val) {
                setState(() {
                  accessToAvatars = val;
                });
              },
              isRound: true,
              title: 'Access to all avatar illustrations')
        ],
      ),
    );
  }
}
