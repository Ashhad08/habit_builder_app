import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_icon_button.dart';
import '../../../../elements/custom_text.dart';
import 'layout/body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: FrontEndConfigs.kScaffoldBGColor,
        elevation: 0,
        title: const CustomText(
          text: '30 Day Journal Challenge...',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 5),
          child: CustomIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back),
        ),
      ),
      body: const CourseDetailsViewBody(),
    );
  }
}
