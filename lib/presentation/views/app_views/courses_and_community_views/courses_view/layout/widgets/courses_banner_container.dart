import 'package:flutter/material.dart';

import '../../../../../../elements/custom_text.dart';

class CoursesBannerContainer extends StatelessWidget {
  const CoursesBannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/courses_banner.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomText(
              text: 'Habit\ncourses',
              fontSize: 36,
              fontFamily: 'Klasik',
              fontWeight: FontWeight.w400),
          CustomText(
              text:
                  'Find what fascinates you as you explore\nthese habit courses.',
              fontSize: 12,
              fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
