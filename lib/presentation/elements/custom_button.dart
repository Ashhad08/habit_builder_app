import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: FrontEndConfigs.kPrimaryColor,
            foregroundColor: FrontEndConfigs.kHabitColor,
            elevation: 0,
            shadowColor: FrontEndConfigs.kHabitColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: CustomText(
          text: buttonText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textColor: FrontEndConfigs.kSecondaryColor,
        ),
      ),
    );
  }
}
