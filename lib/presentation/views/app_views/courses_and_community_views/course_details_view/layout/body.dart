import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_text.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/course1.png'),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: FrontEndConfigs.kWhiteColor),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: FrontEndConfigs.kWhiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FrontEndConfigs.kWhiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        bottom: 18, top: 25, left: 16, right: 20),
                    child: FittedBox(
                      child: CustomText(
                          text:
                              '30 Day Journal Challenge - Establish a\nHabit of Daily Journaling',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Divider(
                    color: FrontEndConfigs.kScaffoldBGColor,
                    height: 0,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CustomText(
                        text: '37 Lessons (2h 41m)',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCourseChapters(
                      icon: Icons.play_arrow_rounded,
                      chapterName: '1. Introduction',
                      duration: '2:16'),
                  _buildCourseChapters(
                      icon: Icons.lock,
                      chapterName: '1. Adopting Prompts to Covid-19...',
                      duration: '3:08'),
                  _buildCourseChapters(
                      icon: Icons.lock,
                      chapterName: '3. Choosing a Notebook',
                      duration: '6:06'),
                  _buildCourseChapters(
                      icon: Icons.lock,
                      chapterName: '4. Optional Supplies',
                      duration: '2:04'),
                  _buildCourseChapters(
                      icon: Icons.lock,
                      chapterName: '5. Day 1',
                      duration: '3:38 '),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCourseChapters(
      {required IconData icon,
      required String chapterName,
      required String duration}) {
    return Column(
      children: [
        const Divider(
          color: FrontEndConfigs.kScaffoldBGColor,
        ),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: FrontEndConfigs.kPrimaryColor.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                color: FrontEndConfigs.kPrimaryColor,
                size: 28,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomText(
                  text: chapterName, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            CustomText(
              text: duration,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}
