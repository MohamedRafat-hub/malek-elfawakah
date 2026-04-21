import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/cart_item_entity.dart';
import '../../managers/cartItemCubit/cart_item_cubit.dart';

class CartItemControls extends StatelessWidget {
  const CartItemControls({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        GestureDetector(
          onTap: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: SvgPicture.asset(
            'assets/icons/add_icon.svg',
            width: 30,
          ),
        ),
        Text(
          cartItemEntity.count.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: SvgPicture.asset(
            'assets/icons/remove_icon.svg',
            width: 30,
          ),
        ),
        Spacer(),
        Text(
          '${cartItemEntity.calculateTotalPrice()} جنيه',
          style: TextStyle(
            color: const Color(0xFFF4A91F),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}