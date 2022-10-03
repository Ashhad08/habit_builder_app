import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';
import 'custom_text.dart';

class AuthWithOtherPlatforms extends StatelessWidget {
  const AuthWithOtherPlatforms({
    Key? key,
    required this.image,
    required this.text,
    this.widthBetween = 30,
  }) : super(key: key);
  final String image;
  final String text;
  final double widthBetween;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: FrontEndConfigs.kWhiteColor,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 23,
            height: 23,
          ),
          SizedBox(
            width: widthBetween,
          ),
          CustomText(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
