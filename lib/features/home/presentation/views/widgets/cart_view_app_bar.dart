import 'package:flutter/material.dart';

class CartViewAppBar extends StatelessWidget {
  const CartViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        Spacer(),
        Text(
          'السلة',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}