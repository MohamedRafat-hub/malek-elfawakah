import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_app_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
    required this.cartEntity,
  });

  static const routeName = 'Checkout View';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
     orderEntity = OrderEntity(
         uid: FirebaseAuth.instance.currentUser!.uid,
        cartEntity: widget.cartEntity,
        shippingAddress: ShippingAddressEntity());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppBar(title: 'الشحن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Provider.value(
            value: orderEntity,
            child: CheckoutViewBody()),
      ),
    );
  }
}
