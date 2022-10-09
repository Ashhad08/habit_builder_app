import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class AnalyticsContainer extends StatelessWidget {
  const AnalyticsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
          color: FrontEndConfigs.kWhiteColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              _buildSingleAnalytics(
                  value: '20 Days',
                  title: 'Longest Streak',
                  circleFillColor:
                      FrontEndConfigs.kPrimaryColor.withOpacity(0.2),
                  iconPath: 'assets/images/flame.png'),
              Container(
                height: 95,
                width: 1,
                color: FrontEndConfigs.kScaffoldBGColor,
              ),
              _buildSingleAnalytics(
                  value: '0 Days',
                  title: 'Current Streak',
                  circleFillColor: const Color(0xffF65B4E).withOpacity(0.2),
                  iconPath: 'assets/images/flash.png'),
            ],
          ),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            thickness: 1,
            height: 0,
          ),
          Row(
            children: [
              _buildSingleAnalytics(
                  value: '98 %',
                  title: 'Completion Rate',
                  circleFillColor: const Color(0xff29319F).withOpacity(0.2),
                  iconPath: 'assets/images/Rate.png'),
              Container(
                height: 95,
                width: 1,
                color: FrontEndConfigs.kScaffoldBGColor,
              ),
              _buildSingleAnalytics(
                  value: '7',
                  title: 'Average Easiness\nScore',
                  circleFillColor: const Color(0xff973456).withOpacity(0.2),
                  iconPath: 'assets/images/leaf.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSingleAnalytics(
      {required String value,
      required String title,
      required circleFillColor,
      required iconPath}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: value,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'Klasik',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                  text: title,
                  fontSize: 12,
                  textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500),
            ],
          ),
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: circleFillColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                scale: 4,
                image: AssetImage(iconPath),
              ),
            ),
          )
        ],
      ),
    );
  }
}
