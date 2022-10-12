import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    this.subTitle,
    required this.addSubTitle,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String? subTitle;
  final bool addSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: FrontEndConfigs.kWhiteColor,
      ),
      child: ListTile(
        leading: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: FrontEndConfigs.kPrimaryColor.withOpacity(0.2),
          ),
          child: Icon(
            icon,
            size: 22,
            color: FrontEndConfigs.kPrimaryColor,
          ),
        ),
        title:
            CustomText(text: title, fontSize: 16, fontWeight: FontWeight.w500),
        subtitle: addSubTitle
            ? CustomText(
                text: subTitle ?? '',
                fontSize: 12,
                textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                fontWeight: FontWeight.w500)
            : null,
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: FrontEndConfigs.kSecondaryColor,
          size: 28,
        ),
      ),
    );
  }
}
