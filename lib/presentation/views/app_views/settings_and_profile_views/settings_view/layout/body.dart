import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../../navigation/route_names.dart';
import '../../../../../elements/custom_button.dart';
import '../../../../../elements/custom_text.dart';
import 'widgets/settings_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.only(left: 15, bottom: 20),
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
                  const CustomText(
                      text: 'Check Your Profile',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                      text: 'jonathansmith@gmail.com',
                      fontSize: 11,
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                      fontWeight: FontWeight.w700),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'View',
                    height: 40,
                    width: 120,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.profileViewRoute);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            const CustomText(
              text: 'General',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            const SettingsTile(
              icon: Icons.notifications,
              title: 'Notifications',
              addSubTitle: true,
              subTitle: 'Customize notifications',
            ),
            const SizedBox(
              height: 8,
            ),
            const SettingsTile(
              icon: Icons.more_horiz,
              title: 'More customization',
              addSubTitle: true,
              subTitle: 'Customize it more to fit your usage',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomText(
              text: 'Support',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            const SettingsTile(
                icon: Icons.whatsapp_rounded,
                title: 'Contact',
                addSubTitle: false),
            const SizedBox(
              height: 8,
            ),
            const SettingsTile(
                icon: Icons.message, title: 'Feedback', addSubTitle: false),
            const SizedBox(
              height: 8,
            ),
            const SettingsTile(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                addSubTitle: false),
            const SizedBox(
              height: 8,
            ),
            const SettingsTile(
                icon: Icons.error, title: 'About', addSubTitle: false),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
