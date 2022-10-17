import 'package:flutter/material.dart';
import 'package:habit_builder_app/backend/models/habit_model.dart';

import '../presentation/elements/custom_text.dart';
import '../presentation/views/app_views/bottom_bar_view/bottom_bar_view.dart';
import '../presentation/views/app_views/courses_and_community_views/course_details_view/course_details_view.dart';
import '../presentation/views/app_views/homePage_views/create_new_habit_view/create_new_habit.dart';
import '../presentation/views/app_views/homePage_views/habit_details_view/habit_details_view.dart';
import '../presentation/views/app_views/settings_and_profile_views/profile_view/profile_view.dart';
import '../presentation/views/app_views/settings_and_profile_views/subscription_view/subscription_view.dart';
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
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteNames.onBoardingViewRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RouteNames.getStartedViewRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
      case RouteNames.loginViewRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.signUpViewRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case RouteNames.forgotPasswordViewRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case RouteNames.bottomBarViewRoute:
        return MaterialPageRoute(builder: (_) => const BottomBarView());
      case RouteNames.createNewHabitViewRoute:
        return MaterialPageRoute(builder: (_) => const CreateNewHabitView());
      case RouteNames.habitDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => HabitDetailsView(settings.arguments as HabitModel),
        );
      case RouteNames.courseDetailsViewRoute:
        return MaterialPageRoute(builder: (_) => const CourseDetailsView());
      case RouteNames.profileViewRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case RouteNames.subscriptionViewRoute:
        return MaterialPageRoute(builder: (_) => const SubscriptionView());
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
