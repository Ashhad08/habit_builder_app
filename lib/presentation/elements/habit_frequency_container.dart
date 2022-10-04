import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class HabitFrequencyContainer extends StatelessWidget {
  const HabitFrequencyContainer({
    Key? key,
    required this.width,
    required this.fillColor,
    required this.frequency,
  }) : super(key: key);
  final double width;
  final Color fillColor;
  final double frequency;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: FrontEndConfigs.kScaffoldBGColor,
          borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                fillColor,
                FrontEndConfigs.kScaffoldBGColor,
                FrontEndConfigs.kScaffoldBGColor,
              ],
              stops: [frequency, frequency, 1],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
