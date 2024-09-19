import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/features/auth/widgets/custom_signup_form.dart';
import 'package:carwashing/features/auth/widgets/have_an_account_widget.dart';
import 'package:carwashing/features/auth/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
         const SliverToBoxAdapter(
            child: SignUpTitle(),
          ),
          SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:const CustomSignUpForm(),
        ),),
          SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: 'AlreadyHaveAnAccount',
                text2: 'SignIn',
                onTap: () {
                  customNavigate(context,path:  "/signInView");
                },
              ),
            ),
        ],
      ),
    );
  }
}