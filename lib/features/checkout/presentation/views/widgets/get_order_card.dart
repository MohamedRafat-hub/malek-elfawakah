import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/order_model.dart';
import '../../../domain/entities/order_entity.dart';

class OrderCard extends StatefulWidget {
  final bool initialExpanded;

  const OrderCard({Key? key, this.initialExpanded = false, required this.orderEntity}) : super(key: key);
  final OrderEntity orderEntity;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;
  }

  @override
  Widget build(BuildContext context) {
    const cardBg = Color(0xFFF9FAFA);
    const primaryColor = Color(0xFF1B5E3A);
    const lightGreenBg = Color(0xFFE8F5E9);
    const textGrey = Color(0xFF9E9E9E);

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: _isExpanded
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: lightGreenBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    color: primaryColor,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'طلب رقم : ${(widget.orderEntity.orderNumber)}#',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (_isExpanded) ...[
                        const SizedBox(height: 4),
                         Text(
                          'تم الطلب :${_formatDate(widget.orderEntity.date)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: textGrey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                             Text(
                              'عدد الطلبات : ${(widget.orderEntity as OrderModel).orderProducts.length}',
                              style: TextStyle(
                                fontSize: 13,
                                color: textGrey,
                              ),
                            ),
                            const SizedBox(width: 12),
                             Text(
                              '${(widget.orderEntity as OrderModel).totalPrice} جنية',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: textGrey,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    try {
      final parsed = DateTime.parse(date);
      return DateFormat('d MMMM ,yyyy', 'ar').format(parsed);
    } catch (e) {
      return date; // لو التاريخ مش بالصيغة دي يرجعه زي ما هو
    }
  }
}