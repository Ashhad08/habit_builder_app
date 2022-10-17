import 'package:flutter/material.dart';

import '../../../../../backend/services/auth.dart';
import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  ForgotPasswordViewBody({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(
                      text: 'Forgot your password?',
                      fontSize: 24,
                      fontFamily: 'Klasik',
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/forgotpass.png'),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: FrontEndConfigs.kWhiteColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const CustomText(
                        text:
                        'Enter your registered email below to receive\npassword reset instruction',
                        fontSize: 12,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w500),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextField(
                        hintText: 'Email',
                        isPrefix: false,
                        controller: _emailController,
                        isPasswordField: false,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Kindly enter your email';
                          }else{
                            return null;
                          }
                        },
                        fillColor: FrontEndConfigs.kScaffoldBGColor),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        buttonText: 'Send Reset Link',
                        height: 60,
                        width: double.infinity,
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            FrontEndConfigs.showToast(
                                toastMessage: 'Wait', color: Colors.red);
                            _authServices
                                .resetPassword(email: _emailController.text)
                                .then((value) {
                              FrontEndConfigs.showToast(
                                  toastMessage: 'Check your email',
                                  color: FrontEndConfigs.kSecondaryColor)
                                  .then((value) {
                                Navigator.pop(context);
                              });
                            }).onError((error, stackTrace) {
                              FrontEndConfigs.showToast(
                                  toastMessage:
                                  'something went wrong! try Again',
                                  color: Colors.red);
                            });
                          }
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                            text: 'Remember password? ',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CustomText(
                              text: 'Login',
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
