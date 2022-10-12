import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign? align;
  final String fontFamily;
  final TextDecoration? textDecoration;
  final int? maxLines;

  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.textColor = FrontEndConfigs.kSecondaryColor,
      this.align = TextAlign.start,
      this.fontFamily = 'Manrope',
      this.textDecoration,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
          color: textColor),
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
