
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../signup_view.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: 'لا تمتلك حساب؟ ',
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        Gap(4),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, SignupView.routeName),
          child: CustomText(
            text: 'قم بإنشاء حساب',
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}