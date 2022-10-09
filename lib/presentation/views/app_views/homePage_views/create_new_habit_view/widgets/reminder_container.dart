import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_switch.dart';
import '../../../../../elements/custom_text.dart';

class ReminderContainer extends StatelessWidget {
  const ReminderContainer(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.reminderTime})
      : super(key: key);
  final bool value;
  final Function(bool) onChanged;
  final String reminderTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: value
              ? FrontEndConfigs.kScaffoldBGColor
              : FrontEndConfigs.kSecondaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
              child: CustomText(
                  text: reminderTime,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          CustomSwitch(
            value: value,
            activeColor: FrontEndConfigs.kPrimaryColor.withOpacity(0.2),
            onChanged: (val) => onChanged(val),
          ),
        ],
      ),
    );
  }
}
