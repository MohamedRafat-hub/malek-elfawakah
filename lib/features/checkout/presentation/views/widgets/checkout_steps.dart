import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_show_snack_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController,
      required this.formKey});

  final int currentPageIndex;
  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            getStepsNames().length,
            (index) => Expanded(
                    child: GestureDetector(
                  onTap: () {
                      if (canNavigateTo(index , context)) {
                        pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
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


  bool canNavigateTo(int index , BuildContext context) {
    final order = context.read<OrderEntity>();

    // step 0
    if (currentPageIndex == 0) {
      if (order.payWithCache == null) {
        showSnackBar(context,
            message: 'برجاء اختيار طريقة الدفع',
            color: Colors.red);
        return false;
      }

      if (index == 2 && !formKey.currentState!.validate()) {
        return false;
      }
    }

    // step 1
    if (currentPageIndex == 1) {
      if (!formKey.currentState!.validate()) {
        if (index > currentPageIndex) {
          showSnackBar(context,
              message: 'برجاء ملئ جميع الحقول أولا',
              color: Colors.red);
          return false;
        }
      }
    }
    return true;
  }

}
