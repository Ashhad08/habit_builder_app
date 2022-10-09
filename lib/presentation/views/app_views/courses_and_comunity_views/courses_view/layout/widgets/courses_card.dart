import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_icon_button.dart';
import '../../../../../../elements/custom_text.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({
    Key? key,
    required this.imagePath,
    required this.courseName,
    required this.duration,
    required this.lessons,
  }) : super(key: key);
  final String imagePath;
  final String courseName;
  final String duration;
  final String lessons;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 274,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: FrontEndConfigs.kWhiteColor,
                child: Column(
                  children: [
                    FittedBox(
                      child: CustomText(
                          text: courseName,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: duration,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            CustomText(
                              text: lessons,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              textColor: FrontEndConfigs.kSecondaryColor
                                  .withOpacity(0.5),
                            ),
                          ],
                        ),
                        CustomIconButton(
                          onPressed: () {},
                          icon: Icons.bookmark_border,
                          size: 36,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
