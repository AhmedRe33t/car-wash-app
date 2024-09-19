import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceHeader extends StatelessWidget {
  const ServiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Services',
              style: CustomTextStyle.poppins300style12.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
            ),
          ),
        ),
        Positioned(
          right: 16.0.w,
          top: 0.0,
          bottom: 0.0,
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25.sp,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ),
      ],
    );
  }
}