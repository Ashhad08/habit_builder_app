import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../backend/models/habit_model.dart';
import '../../../../../../backend/services/system_services.dart';
import '../../../../../../configurations/front_end.dart';
import '../../../../../../navigation/route_names.dart';
import '../../../../../elements/custom_text.dart';
import '../../../../../elements/habit_frequency_container.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({Key? key}) : super(key: key);
  final _lastWeekDates = List.generate(
    7,
    (index) => DateTime.now().subtract(
      Duration(days: index + 1),
    ),
  );
  final _systemServices = SystemServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0, 0.7),
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/Background.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.only(left: 15),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      alignment: Alignment.centerRight,
                      image: AssetImage('assets/images/qoute.png')),
                  color: FrontEndConfigs.kWhiteColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const FittedBox(
                    child: CustomText(
                        text:
                            'We first make our habits,\nand then our habits\nmakes us.',
                        fontSize: 16,
                        align: TextAlign.start,
                        fontFamily: 'Klasik',
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                      text: '- ANONYMOUS',
                      fontSize: 11,
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                      fontWeight: FontWeight.w700)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const CustomText(
                      text: 'HABITS',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _lastWeekDates.length,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                                color: FrontEndConfigs.kWhiteColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: DateFormat('EEE')
                                      .format(_lastWeekDates[index])
                                      .toUpperCase(),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  textColor: FrontEndConfigs.kSecondaryColor
                                      .withOpacity(0.5),
                                ),
                                CustomText(
                                    text: DateFormat('d')
                                        .format(_lastWeekDates[index])
                                        .toUpperCase(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamProvider.value(
              value: _systemServices.fetchCurrentUserActiveHabits(),
              initialData: [HabitModel()],
              builder: (context, child) {
                try {
                  List<HabitModel> habitsList =
                      context.watch<List<HabitModel>>();
                  if (habitsList.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: habitsList.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            Color color = Color(
                                    (math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                .withOpacity(1.0);
                            return Container(
                              height: 75,
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: FrontEndConfigs.kWhiteColor),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            RouteNames.habitDetailsViewRoute,
                                            arguments: habitsList[index]);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: CustomText(
                                            text: habitsList[index].habitName ??
                                                '',
                                            fontSize: 14,
                                            align: TextAlign.center,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 75,
                                    width: 1,
                                    color: FrontEndConfigs.kScaffoldBGColor,
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(10),
                                        itemCount: 7,
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return HabitFrequencyContainer(
                                            width: 50,
                                            fillColor: color,
                                            frequency: 0.4,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return const SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Center(
                        child: CustomText(
                          text: 'NO habits created',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          textColor: FrontEndConfigs.kSecondaryColor,
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  debugPrint(e.toString());
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
