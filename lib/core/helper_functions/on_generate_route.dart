import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splah_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
