import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../backend/models/user_model.dart';
import '../../../../../backend/services/auth.dart';
import '../../../../../backend/services/system_services.dart';
import '../../../../../configurations/front_end.dart';
import '../../../../../navigation/route_names.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool isLoading = false;
  final _authServices = AuthServices();
  final _systemServices = SystemServices();

  @override
  void dispose() {
    _nameController.dispose();
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _key,
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
                Stack(
                  children: [
                    AuthTextField(
                        hintText: 'Name',
                        controller: _nameController,
                        prefixIcon: CupertinoIcons.person,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Kindly enter your name';
                          } else {
                            return null;
                          }
                        },
                        isPasswordField: false,
                        fillColor: FrontEndConfigs.kWhiteColor),
                    Container(
                      height: 56,
                      width: 1,
                      margin: const EdgeInsets.only(left: 40),
                      color: FrontEndConfigs.kScaffoldBGColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    AuthTextField(
                        hintText: 'Email',
                        prefixIcon: Icons.email_outlined,
                        isPasswordField: false,
                        controller: _emailController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Kindly enter your email';
                          } else {
                            return null;
                          }
                        },
                        fillColor: FrontEndConfigs.kWhiteColor),
                    Container(
                      height: 56,
                      width: 1,
                      margin: const EdgeInsets.only(left: 40),
                      color: FrontEndConfigs.kScaffoldBGColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    AuthTextField(
                        hintText: 'Password',
                        prefixIcon: CupertinoIcons.lock,
                        controller: _passwordController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Kindly enter your password';
                          } else if (val.length < 6) {
                            return 'Enter at least 6 letters';
                          } else {
                            return null;
                          }
                        },
                        isPasswordField: true,
                        obscureText: true,
                        fillColor: FrontEndConfigs.kWhiteColor),
                    Container(
                      height: 56,
                      width: 1,
                      margin: const EdgeInsets.only(left: 40),
                      color: FrontEndConfigs.kScaffoldBGColor,
                    )
                  ],
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
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        makeLoadingTrue();
                        _authServices
                            .signUpUser(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) async {
                          await _systemServices
                              .createUser(
                            userModel: UserModel(
                                uid: FirebaseAuth.instance.currentUser!.uid,
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text),
                          )
                              .then((value) {
                            makeLoadingFalse();
                            FrontEndConfigs.showToast(
                                toastMessage: 'Welcome',
                                color: FrontEndConfigs.kSecondaryColor);
                            Navigator.pushNamed(
                                context, RouteNames.bottomBarViewRoute);
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            FrontEndConfigs.showToast(
                                toastMessage: 'Something went wrong try again',
                                color: Colors.red);
                          });
                        }).onError((error, stackTrace) {
                          makeLoadingFalse();
                          if (error
                              .toString()
                              .contains('operation-not-allowed')) {
                            FrontEndConfigs.showToast(
                                toastMessage:
                                    'Anonymous accounts are not enabled',
                                color: Colors.red);
                          } else if (error
                              .toString()
                              .contains('weak-password')) {
                            FrontEndConfigs.showToast(
                                toastMessage: 'Your password is too weak',
                                color: Colors.red);
                          } else if (error
                                  .toString()
                                  .contains('invalid-email') ||
                              error.toString().contains('invalid-credential')) {
                            FrontEndConfigs.showToast(
                                toastMessage: 'Your email is invalid',
                                color: Colors.red);
                          } else if (error
                              .toString()
                              .contains('email-already-in-use')) {
                            FrontEndConfigs.showToast(
                                toastMessage:
                                    'Email is already in use on different account',
                                color: Colors.red);
                          } else if (error
                              .toString()
                              .contains('network-request-failed')) {
                            FrontEndConfigs.showToast(
                                toastMessage: 'Check your internet connection',
                                color: Colors.red);
                          } else {
                            debugPrint(error.toString());
                          }
                        });
                      }
                    }),
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
                      textColor:
                          FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
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
