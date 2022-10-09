import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';
import 'frequency_column.dart';

class FrequencyDetailsContainer extends StatelessWidget {
  const FrequencyDetailsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 146,
      padding: const EdgeInsets.only(top: 17),
      decoration: BoxDecoration(
        color: FrontEndConfigs.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: CustomText(
                text: 'Habit Frequency',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 17,
          ),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            height: 0,
            thickness: 1,
          ),
          Row(
            children: [
              const FrequencyColumn(
                frequency: 0,
              ),
              Container(
                color: FrontEndConfigs.kScaffoldBGColor,
                width: 1,
                height: 88,
              ),
              const FrequencyColumn(
                frequency: 30,
              ),
              Container(
                color: FrontEndConfigs.kScaffoldBGColor,
                width: 1,
                height: 88,
              ),
              const FrequencyColumn(
                frequency: 50,
              ),
              Container(
                color: FrontEndConfigs.kScaffoldBGColor,
                width: 1,
                height: 88,
              ),
              const FrequencyColumn(
                frequency: 70,
              ),
              Container(
                color: FrontEndConfigs.kScaffoldBGColor,
                width: 1,
                height: 88,
              ),
              const FrequencyColumn(
                frequency: 90,
              ),
              Container(
                color: FrontEndConfigs.kScaffoldBGColor,
                width: 1,
                height: 88,
              ),
              const FrequencyColumn(
                frequency: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
