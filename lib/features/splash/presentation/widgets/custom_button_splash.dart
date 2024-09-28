
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class CustomSplashButton extends StatefulWidget {
  const CustomSplashButton({
    super.key, required this.path,
  });
   final String path;

  @override
  State<CustomSplashButton> createState() => _CustomSplashButtonState();
}


class _CustomSplashButtonState extends State<CustomSplashButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController; //give me vlue 0 to 1

    late Animation<Offset> sliderButtomAnimation; //get value
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
          position: sliderButtomAnimation,
          child: CustomBtn(text: 'Get Started ',color: AppColors.amperColor,onPressed: () {
                        
                        customNavigaeReplacement(context, path:widget.path );
                      },));
      }, animation: sliderButtomAnimation,
    );
  }
  void _initSlidingAnimated() {
     animationController=AnimationController(vsync: this,duration:const Duration(seconds: 2));
    
     sliderButtomAnimation =Tween<Offset>(begin:const Offset(0, 4) ,end:Offset.zero ).animate(animationController);
       animationController.forward();
  }
}