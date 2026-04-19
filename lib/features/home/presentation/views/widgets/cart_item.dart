import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/images/watermelon.png'),
          ),

          /// Image of the product

          Gap(10),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'بطيخ ',
                      style: TextStyle(
                        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/trash_icon.svg')),
                  ],
                ),

                /// Name of the product and delete icon

                Text(
                  '3 كجم',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFF4A91F) /* Orange-500 */,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 1.60,
                  ),
                ),

                /// Quantity of the product

                Row(
                  spacing: 8,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/add_icon.svg',
                          width: 30,
                        )),
                    Text(
                      '3',
                      style: TextStyle(
                        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/remove_icon.svg',
                          width: 30,
                        )),
                    Spacer(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '60 جنيه',
                            style: TextStyle(
                              color: const Color(0xFFF4A91F) /* Orange-500 */,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: const Color(0xFFF4A91F) /* Orange-500 */,
                              fontSize: 13,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),

                /// Quantity control and price of the product
              ],
            ),
          ),

          Gap(12)
        ],
      ),
    );
  }
}