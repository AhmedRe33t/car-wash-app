
import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_state.dart';
import 'package:carwashing/features/auth/widgets/custom_text_field.dart';
import 'package:carwashing/features/auth/widgets/terms_and_condition_widget%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast("Successfully,Check your email to verfiy your account");
          customNavigaeReplacement(context,path:  "/signInView");
        } else if (state is SignupFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'fristName',
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: 'phone',
                onChanged: (lastName) {
                  authCubit.phone = lastName;
                },
              ),
              CustomTextFormField(
                labelText:'emailAddress',
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
              SizedBox(height: 6.h,),
              TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().uploadImage();
                      },
                      child: const Text(
                         'please select your photo',style: TextStyle(
                        color: Color.fromARGB(255, 4, 42, 73),
                        fontWeight: FontWeight.bold,
              ))),
               SizedBox(height: 6.h,),
              const TermsAndConditionWidget(),
               SizedBox(height: 20.h),
              state is SignupLoadingState
                  ?const CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      color: authCubit.termsAndConditionCheckBoxValue == false
                          ? AppColors.greyColor
                          : null,
                      onPressed: () async{
                        if (authCubit.termsAndConditionCheckBoxValue == true) {
                          if (authCubit.signupFormKey.currentState!
                              .validate()) {
                                
                           await authCubit.signUpWithEmailAndPassword();
                           
                          }
                        }
                      },
                      text: 'signUp'),
                      
            ],
          ),
        );
      },
    );
  }
}
