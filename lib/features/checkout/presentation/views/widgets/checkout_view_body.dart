import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:gap/gap.dart';
import 'checkout_page_view.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener((){
      setState(() {
        currentPageIndex = pageController.page!.round();
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
        Gap(20),
        CheckoutSteps(
          currentPageIndex: currentPageIndex,
          pageController: pageController,
        ),
        CheckoutPageView(
          pageController: pageController,
        ),
        CustomMaterialButton(
            buttonName: getNextButtonText(),
            onPressed: () {
              if(context.read<OrderEntity>().payWithCache != null) {
                pageController.nextPage(
                    duration: Duration(milliseconds: 150),
                    curve: Curves.easeInOut);
              }
              else
                {
                  showSnackBar(context, message: 'برجاء اختيار طريقة الدفع' , color: Colors.red);
                }
            }),
        Gap(50),
      ],
    );
  }
  String getNextButtonText(){
    switch(currentPageIndex){
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع باستخدام PayPal';
       default:
         return 'التالي';
    }
  }
}
