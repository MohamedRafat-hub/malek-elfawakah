import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';

import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CartItem(
        cartItemEntity: cartItems[index],
      ),
      itemCount: cartItems.length,
    );
  }
}