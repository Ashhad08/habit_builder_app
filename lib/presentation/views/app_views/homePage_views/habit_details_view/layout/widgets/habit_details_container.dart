import 'package:flutter/cupertino.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class HabitInfoContainer extends StatelessWidget {
  const HabitInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: FrontEndConfigs.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: FrontEndConfigs.kScaffoldBGColor,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/habit.png'))),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                  text: 'Read a Book',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.bell,
                    color: FrontEndConfigs.kPrimaryColor,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                      text: 'Repeat everyday',
                      fontSize: 12,
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.2),
                      fontWeight: FontWeight.w500)
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.repeat,
                    color: FrontEndConfigs.kPrimaryColor,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                      text: 'Reminders: 5:00 am',
                      fontSize: 12,
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.2),
                      fontWeight: FontWeight.w500)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
