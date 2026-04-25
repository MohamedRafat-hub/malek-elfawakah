import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            getStepsNames().length,
            (index) => Expanded(
                    child: GestureDetector(
                  onTap: () {
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: StepItem(
                      index: index + 1,
                      stepName: getStepsNames()[index],
                      isActive: currentPageIndex >= index),
                ))));
  }

  List<String> getStepsNames() {
    return [
      'الشحن',
      'العنوان',
      'الدفع',
    ];
  }
}
