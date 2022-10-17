import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../backend/services/auth.dart';
import '../../../../../configurations/front_end.dart';
import '../../../../../navigation/route_names.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/auth_with_other_platforms_container.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool isLoading = false;
  final _authServices = AuthServices();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      color: FrontEndConfigs.kPrimaryColor.withOpacity(0.3),
      inAsyncCall: isLoading,
      blurEffectIntensity: 1,
      progressIndicator: const CupertinoActivityIndicator(
        radius: 15,
        color: FrontEndConfigs.kSecondaryColor,
      ),
      child: GestureDetector(
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
              child: Form(
                key: _key,
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
                          const Divider(
                              color: FrontEndConfigs.kScaffoldBGColor),
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
                                  controller: _emailController,
                                  isPasswordField: false,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Kindly enter your email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  fillColor: FrontEndConfigs.kFieldColor,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                AuthTextField(
                                  hintText: 'Password',
                                  prefixIcon: CupertinoIcons.lock,
                                  isPasswordField: true,
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Enter Password!';
                                    } else if (val.length < 7) {
                                      return 'Password must above 6 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  fillColor: FrontEndConfigs.kFieldColor,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                    buttonText: 'Login',
                                    height: 60,
                                    width: double.infinity,
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        makeLoadingTrue();
                                        _authServices
                                            .loginUser(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text)
                                            .then((value) {
                                          makeLoadingFalse();
                                          Navigator.pushNamed(context,
                                              RouteNames.bottomBarViewRoute);
                                        }).onError((error, stackTrace) {
                                          makeLoadingFalse();
                                          if (error
                                              .toString()
                                              .contains('invalid-email')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'Your email is invalid',
                                                color: Colors.red);
                                          } else if (error
                                              .toString()
                                              .contains('wrong-password')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'Your password is wrong.',
                                                color: Colors.red);
                                          } else if (error
                                              .toString()
                                              .contains('user-not-found')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'User with this email doesn\'t exist.',
                                                color: Colors.red);
                                          } else if (error
                                              .toString()
                                              .contains('user-disabled')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'User with this email has been disabled.',
                                                color: Colors.red);
                                          } else if (error
                                              .toString()
                                              .contains('too_many_requests')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'Too many requests. Try again later.',
                                                color: Colors.red);
                                          } else if (error.toString().contains(
                                              'operation_not_allowed')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'Signing in with Email and Password is not enabled.',
                                                color: Colors.red);
                                          } else if (error.toString().contains(
                                              'network-request-failed')) {
                                            FrontEndConfigs.showToast(
                                                toastMessage:
                                                    'Check your internet connection',
                                                color: Colors.red);
                                          } else {
                                            debugPrint(error.toString());
                                          }
                                        });
                                      }
                                    }),
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
                                        Navigator.pushNamed(context,
                                            RouteNames.signUpViewRoute);
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
        ),
      ),
    );
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
