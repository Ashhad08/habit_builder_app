import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FrontEndConfigs {
  static const Color kPrimaryColor = Color(0xffFDA758);
  static const Color kSecondaryColor = Color(0xff573353);
  static const Color kHabitColor = Color(0xffFC9D45);
  static const Color kScaffoldBGColor = Color(0xffFFF3E9);
  static const Color kFieldColor = Color(0xffFFF6ED);
  static const Color kWhiteColor = Colors.white;

  static Future<bool?> showToast(
      {required String toastMessage, required Color color}) {
    return Fluttertoast.showToast(
        msg: toastMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: kWhiteColor,
        fontSize: 14.0);
  }

  static const TextStyle kTextStyle = TextStyle(
      fontFamily: "Manrope",
      color: FrontEndConfigs.kSecondaryColor,
      fontSize: 17,
      fontWeight: FontWeight.w700);
}
