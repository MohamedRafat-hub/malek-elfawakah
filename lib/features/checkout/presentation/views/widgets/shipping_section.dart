
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:gap/gap.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(32),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice()+0.0).toString(),
          isSelected: selectedIndex == 0,
          onTap: (){
            setState(() {
              selectedIndex = 0;
              context.read<OrderEntity>().payWithCache = true;
            });
          },
        ),
        Gap(10),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجى تحديد طريقة الدفع',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 0.0).toString(),
          isSelected: selectedIndex == 1,
          onTap: (){
            setState(() {
              selectedIndex = 1;
              context.read<OrderEntity>().payWithCache = false;
            });
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}