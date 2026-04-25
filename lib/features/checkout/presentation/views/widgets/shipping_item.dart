import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class ShippingItem extends StatelessWidget {
   ShippingItem({super.key, required this.title, required this.subTitle, required this.price , this.onTap , required this.isSelected});
  final String title , subTitle , price;
  void Function()? onTap;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: const EdgeInsets.only(
            top: 16,
            left: 13,
            right: 28,
            bottom: 16,
          ),
          clipBehavior: Clip.antiAlias,
          decoration:isSelected ? BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: const Color(0xFF3A8B33) /* Green-700 */,
            ),
          ): ShapeDecoration(
            color: const Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? Container(
                width: 18,
                height: 18,
                padding: EdgeInsets.all(3), // المسافة بين اللون والبوردر
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey, // البوردر الخارجي
                    ),
                  ),
                ),
                child: Container(
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor, // اللون الداخلي
                    shape: OvalBorder(),
                  ),
                ),
              ) :Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFF949D9E) /* Grayscale-400 */,
                    ),
                  ),
                ),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 1.70,
                    ),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.50),
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: TextStyle(
                    color: const Color(0xFF3A8B33),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}