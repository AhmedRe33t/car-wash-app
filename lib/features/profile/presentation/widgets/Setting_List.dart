import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItemListtile extends StatelessWidget {
   SettingItemListtile({super.key, required this.icon, required this.title, required this.color,this.onTap});
 final Icon icon;
 final String title;
 final Color color;
 void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 16.h),
      child: ListTile
            (
              onTap: onTap,
              leading:Container
              (
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration
                (
                  color:color ,
                  borderRadius: BorderRadius.circular(30.w)
                ),
                child: Icon(icon.icon,color: AppColors.whiteColor,),
              ) ,
              title: Text(title,style: CustomTextStyle.poppins500style18.copyWith
              (
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),),
            ),
    );
  }
}