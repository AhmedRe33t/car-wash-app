
import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_state.dart';
import 'package:carwashing/features/auth/widgets/custom_remember_me.dart';
import 'package:carwashing/features/auth/widgets/custom_text_field.dart';
import 'package:carwashing/features/auth/widgets/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customNavigaeReplacement(context, path: "/beforeStartBody")
              : showToast("Please Verify Your Account");
        } else if (state is SigninFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'E-mail',
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                labelText: 'password',
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
               SizedBox(height: 16.h),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                CustomRememberMe(),
                ForgotPasswordTextWidget()]),
               SizedBox(height: 6.h),
              state is SigninLoadingState
                  ? const CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                    color: AppColors.amperColor,
                      onPressed: () async {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          await authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: 'SignIn'),
            ],
          ),
        );
      },
    );
  }
}

