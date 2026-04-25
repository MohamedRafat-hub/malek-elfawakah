
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:gap/gap.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(32),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
          isSelected: selectedIndex == 0,
          onTap: (){
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        Gap(10),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجى تحديد طريقة الدفع',
          price: '40',
          isSelected: selectedIndex == 1,
          onTap: (){
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
      ],
    );
  }
}