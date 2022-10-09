import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';

class ShowTimePickerSheet extends StatelessWidget {
  const ShowTimePickerSheet(
      {Key? key,
      required this.onCancel,
      required this.onSave,
      required this.onTimeChanged})
      : super(key: key);
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final Function(DateTime) onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: FrontEndConfigs.kWhiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: onCancel,
                child: const CustomText(
                  text: 'Cancel',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textColor: FrontEndConfigs.kHabitColor,
                ),
              ),
              const Spacer(),
              const CustomText(
                text: 'Add Reminders',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onSave,
                child: const CustomText(
                  text: 'Save',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textColor: FrontEndConfigs.kHabitColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
          ),
          Expanded(
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                      fontFamily: 'Manrope',
                      color: FrontEndConfigs.kSecondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newTime) => onTimeChanged(newTime),
              ),
            ),
          )
        ],
      ),
    );
  }
}
