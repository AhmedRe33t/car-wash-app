import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key, });



  @override

  Widget build(BuildContext context) {
    return  Container(
              height: 250.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)

                )
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(height: 70.h,),
                    Text('Create account',style: CustomTextStyle.poppins600style24,),
                     Text('Join us now!!!We Wash Cars,You Relax',style: CustomTextStyle.poppins300style12,),
                     
                    
                  ],
                ),
              ),
              
         );
  }
}