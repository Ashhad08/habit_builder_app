import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../../navigation/route_names.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/auth_with_other_platforms_container.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/login.png'),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xffFFF3E9).withOpacity(0.0),
                  const Color(0xffFFF3E9),
                  const Color(0xffFFF3E9)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.45, 1]),
          ),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: const [
                      FittedBox(
                        child: CustomText(
                          text: 'WELCOME TO\nMonumental habits',
                          fontSize: 32,
                          align: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Klasik",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AuthWithOtherPlatforms(
                        text: 'Continue with  Google',
                        image: 'assets/images/google.png',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AuthWithOtherPlatforms(
                        text: 'Continue with  Facebook',
                        image: 'assets/images/facebook.png',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: FrontEndConfigs.kWhiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                          text: 'Log in with email',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      const Divider(color: FrontEndConfigs.kScaffoldBGColor),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            AuthTextField(
                              hintText: 'Email',
                              prefixIcon: Icons.mail_outline_outlined,
                              isPasswordField: false,
                              fillColor: FrontEndConfigs.kFieldColor,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AuthTextField(
                              hintText: 'Password',
                              prefixIcon: CupertinoIcons.lock,
                              isPasswordField: true,
                              obscureText: true,
                              fillColor: FrontEndConfigs.kFieldColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                buttonText: 'Login',
                                height: 60,
                                width: double.infinity,
                                onPressed: () {}),
                            const SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RouteNames.forgotPasswordViewRoute);
                              },
                              child: const CustomText(
                                  text: 'Forgot Password?',
                                  fontSize: 14,
                                  textDecoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(
                                    text: 'Don’t have an account? ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.signUpViewRoute);
                                  },
                                  child: const CustomText(
                                      text: 'Sign up',
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
