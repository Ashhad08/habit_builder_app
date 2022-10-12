import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../../navigation/route_names.dart';
import '../../../../../elements/custom_text.dart';
import '../../../homePage_views/habit_details_view/layout/widgets/analytics_container.dart';
import '../../settings_view/layout/widgets/settings_tile.dart';
import 'widgets/custom_indicator.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: FrontEndConfigs.kWhiteColor),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: FrontEndConfigs.kWhiteColor,
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/user_minimal.png'),
                    ),
                    title: const CustomText(
                        text: 'Marilyn Aminoff',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    subtitle: CustomText(
                      text: 'Name',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                    ),
                    trailing: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: FrontEndConfigs.kSecondaryColor
                                  .withOpacity(0.2))),
                      child: Row(
                        children: const [
                          CustomText(
                              text: 'This week',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: FrontEndConfigs.kSecondaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: FrontEndConfigs.kScaffoldBGColor,
                    height: 0,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const AnalyticsContainer().buildSingleAnalytics(
                          value: '18',
                          title: 'Total Work Hours',
                          circleFillColor:
                              FrontEndConfigs.kPrimaryColor.withOpacity(0.2),
                          iconPath: 'assets/images/clock.png'),
                      Container(
                        height: 70,
                        width: 1,
                        color: FrontEndConfigs.kScaffoldBGColor,
                      ),
                      const AnalyticsContainer().buildSingleAnalytics(
                          value: '12',
                          title: 'Task Completed',
                          circleFillColor:
                              const Color(0xff29319F).withOpacity(0.2),
                          iconPath: 'assets/images/flag.png'),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const Divider(
                    color: FrontEndConfigs.kScaffoldBGColor,
                    height: 0,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      CustomCircularIndicator(
                        percent: 70,
                        color: FrontEndConfigs.kSecondaryColor,
                        footerText: '06/14',
                      ),
                      CustomCircularIndicator(
                        percent: 0,
                        color: Colors.red,
                        footerText: '',
                      ),
                      CustomCircularIndicator(
                        percent: 40,
                        color: FrontEndConfigs.kSecondaryColor,
                        footerText: '06/16',
                      ),
                      CustomCircularIndicator(
                        percent: 90,
                        color: FrontEndConfigs.kSecondaryColor,
                        footerText: '',
                      ),
                      CustomCircularIndicator(
                        percent: 100,
                        color: FrontEndConfigs.kPrimaryColor,
                        footerText: 'Today',
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.subscriptionViewRoute);
              },
              child: const SettingsTile(
                  icon: Icons.credit_card_outlined,
                  title: 'Billing methods',
                  addSubTitle: false),
            ),
            const SizedBox(
              height: 8,
            ),
            const SettingsTile(
                icon: Icons.star, title: 'Longest Streak', addSubTitle: false)
          ],
        ),
      ),
    );
  }
}
