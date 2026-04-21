import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/managers/cartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/managers/cartItemCubit/cart_item_cubit.dart';
import 'package:gap/gap.dart';

import 'cart_item_controllers.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev , current){
        if(current is CartItemUpdated)
          {
            if(current.cartItemEntity == widget.cartItemEntity)
              {
                return true;
              }
          }
        return false;
      },
      builder: (context, state) {
        return Dismissible(
          key: ValueKey(widget.cartItemEntity.productEntity.code),
          // مهم جدًا
          direction: DismissDirection.endToStart,
          // سحب من اليمين لليسار
          onDismissed: (_) {
            context.read<CartCubit>().removeCartItem(widget.cartItemEntity);
          },

          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.delete, color: Colors.white),
          ),

          child: Container(
            padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                    color: const Color(0xFFF3F5F7),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F5F7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                      widget.cartItemEntity.productEntity.imageUrl!),
                ),
                Gap(10),
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.cartItemEntity.productEntity.name,
                            style: TextStyle(
                              color: const Color(0xFF0C0D0D),
                              fontSize: 16,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .removeCartItem(widget.cartItemEntity);
                            },
                            child:
                                SvgPicture.asset('assets/icons/trash_icon.svg'),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.cartItemEntity.calculateTotalWeight()} كجم',
                        style: TextStyle(
                          color: const Color(0xFFF4A91F),
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CartItemControls(cartItemEntity: widget.cartItemEntity),
                    ],
                  ),
                ),
                Gap(12)
              ],
            ),
          ),
        );
      },
    );
  }
}


