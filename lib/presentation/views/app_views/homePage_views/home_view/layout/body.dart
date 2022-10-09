import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../../navigation/route_names.dart';
import '../../../../../elements/custom_text.dart';
import '../../../../../elements/habit_frequency_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

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
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
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
                                  text: 'SUN',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  textColor: FrontEndConfigs.kSecondaryColor
                                      .withOpacity(0.5),
                                ),
                                const CustomText(
                                    text: '17',
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
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
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
                                Navigator.pushNamed(
                                    context, RouteNames.habitDetailsViewRoute);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: FittedBox(
                                  child: CustomText(
                                      text: 'Read a Book',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
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
                                  return const HabitFrequencyContainer(
                                    width: 50,
                                    fillColor: FrontEndConfigs.kHabitColor,
                                    frequency: 0.6,
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
