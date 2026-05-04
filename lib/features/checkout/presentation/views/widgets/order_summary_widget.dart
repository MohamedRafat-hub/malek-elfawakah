import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import '../../../../../core/utils/app_decoration.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: 'ملخص الطلب ',
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: AppDecoration.greyDecoration,
          child: Column(
            spacing: 5,
            children: [
              Row(
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: TextStyle(
                      color: const Color(0xFF4E5556) /* Grayscale-500 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()+0.0} جنية',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'التوصيل  :',
                    style: TextStyle(
                      color: const Color(0xFF4E5556) /* Grayscale-500 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '30.0 جنية',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF4E5556) /* Grayscale-500 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 1.70,
                    ),
                  )
                ],
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                thickness: .5,
              ),
              Row(
                children: [
                  Text(
                    'الكلي',
                    style: TextStyle(
                      color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() +30.0 }جنيه',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
