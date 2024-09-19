
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashImage extends StatelessWidget {
  const CustomSplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image:const DecorationImage(image: AssetImage(Assets.imagesSplashImage),fit: BoxFit.fill)
      ),
    );
  }
}