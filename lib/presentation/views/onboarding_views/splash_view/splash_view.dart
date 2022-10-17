import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../navigation/route_names.dart';
import '../../../elements/custom_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.pushNamed(context, RouteNames.bottomBarViewRoute)
          : Navigator.pushNamed(
              context,
              RouteNames.onBoardingViewRoute,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 90),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/splash.png'),
          ),
        ),
        child: const CustomText(
            text: 'WELCOME TO\nMonumental\nhabits',
            fontSize: 38,
            align: TextAlign.center,
            fontFamily: "Klasik",
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
