import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_show_snack_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_view.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../managers/cartCubit/cart_cubit.dart';
import '../../managers/cartItemCubit/cart_item_cubit.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomMaterialButton(
          buttonName:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه ',
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(context, CheckoutView.routeName,
                  arguments: context.read<CartCubit>().cartEntity);
            } else {
              showSnackBar(context,
                  message: 'سلة التسوق فارغة', color: Colors.red);
            }
          },
        );
      },
    );
  }
}
