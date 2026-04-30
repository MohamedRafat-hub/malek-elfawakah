import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_decoration.dart';
import 'package:gap/gap.dart';

import 'address_item.dart';
import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24),
        OrderSummaryWidget(),
        Gap(16),
        AddressItem(),
      ],
    );
  }
}




