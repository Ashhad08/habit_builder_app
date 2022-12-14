import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile(
      {Key? key,
      required this.checkBoxValue,
      required this.onChanged,
      required this.title,
      this.isRound = false})
      : super(key: key);
  final bool checkBoxValue;
  final Function(bool) onChanged;
  final String title;
  final bool isRound;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data:
              ThemeData(unselectedWidgetColor: FrontEndConfigs.kSecondaryColor),
          child: Checkbox(
              value: checkBoxValue,
              onChanged: (val) => onChanged(val!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isRound ? 100 : 6),
              ),
              checkColor: FrontEndConfigs.kSecondaryColor,
              activeColor: FrontEndConfigs.kPrimaryColor),
        ),
        Expanded(
            child: CustomText(
                text: title, fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
