import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          '$productsLength  نتائج ',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0x66CACECE),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: SvgPicture.asset('assets/icons/filter_icon.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
