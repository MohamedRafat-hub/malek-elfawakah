import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../home/presentation/views/main_view.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                  child: Text(
                'تم تسجيل الدخول بنجاح',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
              backgroundColor: AppColors.primaryColor,
            ),
          );
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                  child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoginLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}
