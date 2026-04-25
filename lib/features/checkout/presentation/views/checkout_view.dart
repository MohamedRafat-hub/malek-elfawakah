import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_app_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'Checkout View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppBar(title: 'الشحن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CheckoutViewBody(),
      ),
    );
  }
}



