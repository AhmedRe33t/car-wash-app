import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class standered_screens extends StatelessWidget {
  const standered_screens({
    super.key, required this.title, required this.subTitle,
  });
 final String title;
 final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Text(title,style: CustomTextStyle.pacifico600style24.copyWith(color: AppColors.primaryColor),),
        Text(subTitle,style: CustomTextStyle.poppins500style18.copyWith(color: AppColors.greyColor),),
        SizedBox(height: 40.h,),
        const Divider()
        
      ],
    );
  }
}