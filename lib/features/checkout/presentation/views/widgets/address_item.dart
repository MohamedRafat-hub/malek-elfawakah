import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_decoration.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(title: 'عنوان التوصيل', child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 12),
      decoration: AppDecoration.greyDecoration,
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Text('${context.read<OrderEntity>().shippingAddress.address}'  , style: TextStyle(color: Colors.black,
            fontSize: 16 , fontWeight: FontWeight.w500,
          ),),
          Spacer(),
          GestureDetector(
            onTap: (){
              pageController.animateToPage(1, duration: Duration(milliseconds: 150), curve:Curves.easeIn );
            },
            child: Row(
              children: [
                Icon(Icons.edit_rounded , color: Colors.grey,),
                Text('تعديل' , style: TextStyle( color: Colors.black),),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}