import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('تم إنشاء حساب بنجاح' , style: TextStyle(color: Colors.white , fontSize: 16),)),
              backgroundColor: AppColors.primaryColor,
            ),
          );
          Navigator.pop(context);
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text('${state.message}' , style: TextStyle(color: Colors.white , fontSize: 16),)),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: SignUpViewBody());
      },
    );
  }
}