import 'package:flutter/cupertino.dart';

import '../../configurations/front_end.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.activeColor = FrontEndConfigs.kScaffoldBGColor})
      : super(key: key);
  final bool value;
  final Function(bool) onChanged;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      thumbColor: value == false
          ? FrontEndConfigs.kSecondaryColor
          : FrontEndConfigs.kPrimaryColor,
      activeColor: activeColor,
      trackColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.2),
      onChanged: (val) => onChanged(val),
    );
  }
}
