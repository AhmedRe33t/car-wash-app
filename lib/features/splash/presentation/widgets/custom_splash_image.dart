
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashImage extends StatefulWidget {
  const CustomSplashImage({
    super.key,
  });

  @override
  State<CustomSplashImage> createState() => _CustomSplashImageState();
}


class _CustomSplashImageState extends State<CustomSplashImage> with SingleTickerProviderStateMixin {
  late AnimationController animationController; //give me vlue 0 to 1

    late Animation<Offset> sliderImageAnimation; //get value
  void initState() {
       _initSlidingAnimated();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return 
    AnimatedBuilder(
      builder: (context,_) {
        return SlideTransition(
          position: sliderImageAnimation,
          child: Container(
            height: 200.h,
            
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image:const DecorationImage(image: AssetImage(Assets.imagesSplash),fit: BoxFit.fill)
            ),
          ),
        );
      }, animation: sliderImageAnimation,
    );
  }
  void _initSlidingAnimated() {
     animationController=AnimationController(vsync: this,duration:const Duration(seconds: 2));
    
     sliderImageAnimation =Tween<Offset>(begin:const Offset(3, 0) ,end:Offset.zero ).animate(animationController);
       animationController.forward();
  }
}