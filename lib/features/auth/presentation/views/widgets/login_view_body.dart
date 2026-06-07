import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/or_divider.dart';
import 'custom_text_form_field.dart';
import 'dont_have_account.dart';
import 'forget_password_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool obscureText = true;
  String email = '', password = '';
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
                email = value!.trim();
              },
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16),
            CustomTextFormField(
              onSaved: (value) {
                password = value!.trim();
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
            ForgetPasswordWidget(
              onTap: () {
                if (email.trim().isEmpty) {
                  showSnackBar(context,
                      message:
                          'يرجى ادخال البريد الالكتروني في الحقل المخصص له ثم الضغط على نسيت كلمة المرور',
                      color: Colors.red);
                } else {
                  log('send password reset email to $email');
                  context
                      .read<LoginCubit>()
                      .sendPasswordResetEmail(email: email);
                }
              },
            ),
            Gap(16),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  showSnackBar(context,
                      message: state.errorMessage, color: Colors.red);
                } else if (state is LoginSuccess) {
                  showSnackBar(context,
                      message: 'تم تسجيل الدخول بنجاح', color: Colors.green);
                  Navigator.pushReplacementNamed(context, MainView.routeName);
                }
              },
              builder: (context, state) {
                return state is LoginLoading
                    ? CircularProgressIndicator()
                    : CustomMaterialButton(
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
                        });
              },
            ),
            Gap(30),
           DontHaveAccountWidget(),
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
              onPressed: () {
                context.read<LoginCubit>().loginWithApple();
              },
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
