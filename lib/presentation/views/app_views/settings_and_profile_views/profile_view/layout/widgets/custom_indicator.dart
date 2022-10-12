import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    Key? key,
    required this.percent,
    required this.color,
    required this.footerText,
  }) : super(key: key);
  final double percent;
  final Color color;
  final String footerText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircularPercentIndicator(
        radius: 24,
        lineWidth: 3.5,
        footer: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: footerText,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
            ),
          ],
        ),
        animation: true,
        circularStrokeCap: CircularStrokeCap.round,
        percent: percent / 100,
        backgroundColor: color.withOpacity(0.2),
        center: CustomText(
          text: (percent / 10).round().toString(),
          fontSize: 14,
          textColor: color,
          fontWeight: FontWeight.w500,
        ),
        progressColor: color,
        animationDuration: 1000,
      ),
    );
  }
}
