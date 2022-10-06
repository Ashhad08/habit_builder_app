import 'package:flutter/cupertino.dart';

import '../../configurations/front_end.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      thumbColor: value == false
          ? FrontEndConfigs.kSecondaryColor
          : FrontEndConfigs.kPrimaryColor,
      activeColor: FrontEndConfigs.kScaffoldBGColor,
      trackColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.2),
      onChanged: (val) => onChanged(val),
    );
  }
}
