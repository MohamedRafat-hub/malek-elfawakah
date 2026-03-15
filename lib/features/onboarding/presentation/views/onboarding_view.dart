import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/onboarding_page_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const routeName = 'OnboardingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
