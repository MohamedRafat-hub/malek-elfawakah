import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({super.key, required this.pageController, required this.formKey, required this.valueListenable});
  final PageController pageController;
  final GlobalKey<FormState>formKey;
  final ValueListenable<AutovalidateMode>valueListenable;
  @override
  State<CheckoutPageView> createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: PageView.builder(
            controller: widget.pageController,
            itemCount: getPages().length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context , index){
              return getPages()[index];
            }),
      ),
    );
  }
  List<Widget>getPages(){
    return [
      ShippingSection(),
      AddressInputSection(
        formKey: widget.formKey,
        valueListenable: widget.valueListenable,
      ),
      PaymentSection(
        pageController: widget.pageController,
      ),
    ];
  }
}


