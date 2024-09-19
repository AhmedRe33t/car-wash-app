import 'package:carwashing/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomTextStyle{
  static final pacifico600style24=TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
    fontFamily: "Pacifico"
  );

  static final poppins600style24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
    fontFamily: "Poppins",
  );
  

  static final poppins300style12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
    fontFamily: "Poppins",
  );

  static final poppins500style18 = TextStyle(
    fontSize: 18.h,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
    fontFamily: "Poppins",
  );
}