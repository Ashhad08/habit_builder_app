import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_button.dart';
import '../../../../../elements/custom_text.dart';
import 'widgets/analytics_container.dart';
import 'widgets/habit_completion_dialog.dart';
import 'widgets/habit_details_container.dart';

class HabitDetailsViewBody extends StatelessWidget {
  const HabitDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: HabitInfoContainer(),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: FrontEndConfigs.kScaffoldBGColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -40),
                      blurRadius: 30,
                      spreadRadius: -20),
                ]),
            child: Column(
              children: [
                CustomText(
                  text: 'Analytics',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                const AnalyticsContainer(),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                    buttonText: 'Mark Habit as Complete',
                    height: 60,
                    width: double.infinity,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const HabitCompletionDialog();
                          });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
