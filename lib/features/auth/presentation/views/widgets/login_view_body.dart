import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';
import 'package:fruit_hub/core/widgets/custom_text.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/or_divider.dart';
import 'custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool obscureText = true;
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            Gap(24),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16),
            CustomTextFormField(
              onSaved: (value) {
                password = value!;
              },
              obscureText: obscureText,
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              icon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: obscureText
                    ? Icon(CupertinoIcons.eye_slash_fill)
                    : Icon(CupertinoIcons.eye_fill),
              ),
            ),
            Gap(16),
            Row(
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
            Gap(16),
            CustomMaterialButton(
                buttonName: 'تسجيل دخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<LoginCubit>(context)
                        .login(email: email, password: password);
                  } else {
                    {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  }
                }),
            Gap(30),
            Row(
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
            ),
            Gap(30),
            OrDivider(),
            Gap(16),
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              icon: 'assets/icons/google_icon.svg',
              onPressed: () {
                log('login with google');
                context.read<LoginCubit>().loginWithGoogle();
              },
            ),
            Gap(16),
            SocialLoginButton(
              title: 'تسجيل بواسطة أبل',
              icon: 'assets/icons/apple_icon.svg',
              onPressed: () {},
            ),
            Gap(16),
            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              icon: 'assets/icons/facebook_icon.svg',
              onPressed: () {
                log('Login with facebook');
                context.read<LoginCubit>().loginWithFacebook();
              },
            ),
            Gap(16),
          ],
        ),
      ),
    ));
  }
}
