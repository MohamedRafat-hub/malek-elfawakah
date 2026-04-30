import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_app_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity,});
  static const routeName = 'Checkout View';
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppBar(title: 'الشحن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Provider.value(
          value: OrderEntity(cartEntity: cartEntity),
            child: CheckoutViewBody()),
      ),
    );
  }
}



