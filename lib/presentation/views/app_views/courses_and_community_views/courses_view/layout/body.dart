import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';
import 'widgets/courses_banner_container.dart';
import 'widgets/courses_card.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0, 0.7),
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/Background.png'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CoursesBannerContainer(),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const CustomText(
                    text: 'Sort By:',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: FrontEndConfigs.kWhiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                            text: 'Popular',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: FrontEndConfigs.kSecondaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: FrontEndConfigs.kWhiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                            text: 'Filters',
                            fontSize: 14,
                            textColor: FrontEndConfigs.kPrimaryColor,
                            fontWeight: FontWeight.w500),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: FrontEndConfigs.kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const CoursesCard(
                imagePath: 'assets/images/course1.png',
                courseName:
                    '30 Day Journal Challenge - Establish\na Habit of Daily Journaling',
                duration: '2h 41m',
                lessons: '37 Lessons'),
            const SizedBox(
              height: 12,
            ),
            const CoursesCard(
                imagePath: 'assets/images/course2.png',
                courseName:
                    'Self Help Series: How to Create and\nMaintain Good Habits',
                duration: '4h 6m',
                lessons: '24 Lessons'),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
