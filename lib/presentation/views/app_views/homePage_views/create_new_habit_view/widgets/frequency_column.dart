import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';
import '../../../../../elements/habit_frequency_container.dart';

class FrequencyColumn extends StatelessWidget {
  const FrequencyColumn({
    Key? key,
    required this.frequency,
  }) : super(key: key);
  final double frequency;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 16),
        child: Column(
          children: [
            CustomText(
              text: '${frequency.round()}%',
              fontSize: 10,
              fontWeight: FontWeight.w700,
              textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 8,
            ),
            HabitFrequencyContainer(
              width: 38,
              fillColor: FrontEndConfigs.kHabitColor,
              frequency: frequency / 100,
              rightMargin: 0,
            )
          ],
        ),
      ),
    );
  }
}
