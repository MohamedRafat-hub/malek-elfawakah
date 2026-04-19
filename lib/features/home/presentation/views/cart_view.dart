import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_view_app_bar.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CartViewBody()),
    );
  }
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CartViewAppBar(),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF9F1) /* Green1-50 */,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      'لديك 3 منتجات في سله التسوق',
                      style: TextStyle(
                        color: const Color(0xFF1B5E37) /* Green1-500 */,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ],
                )),
          ),
          Gap(20),

          CartItemList(),

          Gap(70),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomMaterialButton(buttonName: 'الدفع 120 جنيه', onPressed: (){},),
          ),


          Gap(70),

        ],
      ),
    );
  }
}






