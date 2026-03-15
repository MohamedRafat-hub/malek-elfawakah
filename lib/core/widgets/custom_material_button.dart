import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key, this.onPressed, required this.buttonName});

  final void Function()? onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
      ),
      color: AppColors.primaryColor,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}