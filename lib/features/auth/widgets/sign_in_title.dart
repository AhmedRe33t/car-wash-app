import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key,  this.text1, this.text2, this.text3, this.text4});
 final String? text1;
  final String? text2;
    final String? text3;
      final String? text4;



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
                    Text(text1.toString()??'',style: CustomTextStyle.poppins600style24,),
                     Text(text2.toString()??'',style: CustomTextStyle.poppins600style24,),
                     SizedBox(height: 6.h,),
                      Text(text3.toString()??'',style: CustomTextStyle.poppins300style12,),
                      Text(text4.toString()??'',style: CustomTextStyle.poppins300style12,)
                  ],
                ),
              ),
              
         );
  }
}