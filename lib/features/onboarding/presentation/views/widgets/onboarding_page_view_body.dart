import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singelton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          animate: true,
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(.5)),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomMaterialButton(
              buttonName: 'ابدأ الان',
              onPressed: () {
                Prefs.setBool(isOnBoardingSeen, true);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
