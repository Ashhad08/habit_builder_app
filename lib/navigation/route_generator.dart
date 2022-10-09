import 'package:flutter/material.dart';

import '../presentation/elements/custom_text.dart';
import '../presentation/views/app_views/bottom_bar_view/bottom_bar_view.dart';
import '../presentation/views/app_views/homePage_views/create_new_habit_view/create_new_habit.dart';
import '../presentation/views/app_views/homePage_views/habit_details_view/habit_details_view.dart';
import '../presentation/views/auth_views/forgot_password_view/forgot_password_view.dart';
import '../presentation/views/auth_views/login_view/login_view.dart';
import '../presentation/views/auth_views/signup_view/signup_view.dart';
import '../presentation/views/onboarding_views/get_started_view/get_started_view.dart';
import '../presentation/views/onboarding_views/onboarding_view/onboarding_view.dart';
import '../presentation/views/onboarding_views/splash_view/splash_view.dart';
import 'route_names.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashViewRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RouteNames.onBoardingViewRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case RouteNames.getStartedViewRoute:
        return MaterialPageRoute(builder: (_) => GetStartedView());
      case RouteNames.loginViewRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RouteNames.signUpViewRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case RouteNames.forgotPasswordViewRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case RouteNames.bottomBarViewRoute:
        return MaterialPageRoute(builder: (_) => BottomBarView());
      case RouteNames.createNewHabitViewRoute:
        return MaterialPageRoute(builder: (_) => CreateNewHabitView());
      case RouteNames.habitDetailsViewRoute:
        return MaterialPageRoute(builder: (_) => HabitDetailsView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: CustomText(
                        text: "NO ROUTES DEFINED",
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ));
    }
  }
}
