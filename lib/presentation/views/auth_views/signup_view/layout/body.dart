import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/auth_with_other_platforms_container.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import 'widgets/checkbox_tile.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool keepSignedIn = false;
  bool emailForPricing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Image.asset(
              'assets/images/signup.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: 'Create your account',
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Klasik',
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AuthTextField(
                      hintText: 'Name',
                      prefixIcon: CupertinoIcons.person,
                      isPasswordField: false,
                      fillColor: FrontEndConfigs.kWhiteColor),
                  Positioned(
                    left: 40,
                    child: Container(
                      height: 56,
                      width: 1,
                      color: FrontEndConfigs.kScaffoldBGColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AuthTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      isPasswordField: false,
                      fillColor: FrontEndConfigs.kWhiteColor),
                  Positioned(
                    left: 40,
                    child: Container(
                      height: 56,
                      width: 1,
                      color: FrontEndConfigs.kScaffoldBGColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AuthTextField(
                      hintText: 'Password',
                      prefixIcon: CupertinoIcons.lock,
                      isPasswordField: true,
                      obscureText: true,
                      fillColor: FrontEndConfigs.kWhiteColor),
                  Positioned(
                    left: 40,
                    child: Container(
                      height: 56,
                      width: 1,
                      color: FrontEndConfigs.kScaffoldBGColor,
                    ),
                  )
                ],
              ),
            ),
            CheckBoxTile(
                checkBoxValue: keepSignedIn,
                onChanged: (val) {
                  setState(() {
                    keepSignedIn = val;
                  });
                },
                title: 'Keep me signed in'),
            CheckBoxTile(
                checkBoxValue: emailForPricing,
                onChanged: (val) {
                  setState(() {
                    emailForPricing = val;
                  });
                },
                title: 'Email me about special pricing and more'),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                buttonText: 'Create Account',
                height: 60,
                width: double.infinity,
                onPressed: () {}),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: 'Or sign in with',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Divider(
                    color: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: AuthWithOtherPlatforms(
                    image: 'assets/images/google.png',
                    text: 'Google',
                    widthBetween: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AuthWithOtherPlatforms(
                    image: 'assets/images/facebook.png',
                    text: 'Facebook',
                    widthBetween: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                    text: 'Already have an account? ',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText(
                      text: 'Sign In',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
