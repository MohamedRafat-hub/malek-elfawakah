import 'package:flutter/material.dart';

import 'custom_notification_widget.dart';

class CustomProductsAppBar extends StatelessWidget {
  const CustomProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          'المنتجات',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomNotificationWidget(),
        ),
      ],
    );
  }
}