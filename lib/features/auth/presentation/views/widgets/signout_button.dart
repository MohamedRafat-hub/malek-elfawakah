import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../cubits/signoutCubit/sign_out_cubit.dart';
import '../login_view.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          showSnackBar(context, message: 'تم تسجيل الخروج بنجاح');
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else if (state is SignOutFailure) {
          showSnackBar(context, message: state.errorMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        return state is SignOutLoading
            ? CircularProgressIndicator()
            : CustomMaterialButton(
          buttonName: 'تسجيل الخروج',
          onPressed: () {
            context.read<SignOutCubit>().signOut();
          },
        );
      },
    );
  }
}
