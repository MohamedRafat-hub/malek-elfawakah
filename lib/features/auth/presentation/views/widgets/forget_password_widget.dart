import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_show_snack_bar.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          showSnackBar(context, message: state.errorMessage, color: Colors.red);
        } else if (state is ResetPasswordSuccess) {
          showSnackBar(context,
              message: 'تم ارسال رابط استعادة كلمة المرور الى بريدك الالكتروني',
              color: Colors.green);
        }
      },
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'نسيت كلمة المرور؟',
              color: Color(0xFF2D9F5D),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}