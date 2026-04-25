import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_decoration.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(8),
        Container(
          decoration: AppDecoration.greyDecoration,
          child: child,
        ),
      ],
    );
  }
}
