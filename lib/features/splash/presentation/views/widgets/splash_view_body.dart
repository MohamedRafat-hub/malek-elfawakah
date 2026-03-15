import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singelton.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      bool isVisible = Prefs.getBool(isOnBoardingSeen);
      isVisible
          ? Navigator.pushReplacementNamed(context, LoginView.routeName)
          : Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset('assets/images/planc.svg'),
          ],
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset(
          'assets/images/splashed_bottom.svg',
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      bool isVisible = Prefs.getBool(isOnBoardingSeen);
      isVisible
          ? Navigator.pushReplacementNamed(context, LoginView.routeName)
          : Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
  }
}
