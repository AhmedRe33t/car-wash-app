import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/features/auth/widgets/custom_signin_form.dart';
import 'package:carwashing/features/auth/widgets/have_an_account_widget.dart';
import 'package:carwashing/features/auth/widgets/sign_in_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
        const  SliverToBoxAdapter( child: SignInTitle(text1:'Sign in to your',
        text2: 'ccount',
           text3: 'Welcome back!',
           text4:'Select method to log in:',),),
          SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
          SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:const CustomSignInForm(),
        ),),
          SliverToBoxAdapter(child: SizedBox(height: 20.h,),),

        SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: 'Havent sign up yet? ',
              text2: 'Sign Up',
              onTap: () {
                customNavigate(context, path: "/signUpView");
              },
            ),
          ),
           
          
        ],
      ),
    );
  }
}
