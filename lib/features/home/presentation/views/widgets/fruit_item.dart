import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){},
                child: Icon(CupertinoIcons.heart)),
            Center(child: Image.asset('assets/images/watermelon1x.png')),
            Gap(10),
            Text(
              'بطيخ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '20جنية ',
                        style: TextStyle(
                          color: const Color(0xFFF4A91F) /* Orange-500 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: const Color(0xFFF4A91F) /* Orange-500 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 1.70,
                        ),
                      ),
                      TextSpan(
                        text: 'الكيلو',
                        style: TextStyle(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 1.70,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/add_icon.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}