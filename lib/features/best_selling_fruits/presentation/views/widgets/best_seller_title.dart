import 'package:flutter/material.dart';

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
        fontSize: 19,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}