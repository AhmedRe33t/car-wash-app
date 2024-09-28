
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatefulWidget {
  const CustomTitle({
    super.key,
  });

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}


class _CustomTitleState extends State<CustomTitle> with SingleTickerProviderStateMixin {
  late AnimationController animationController; //give me vlue 0 to 1

    late Animation<Offset> sliderTextAnimation; //get value
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
          position: sliderTextAnimation,
          child: Column(
            children:[
                    Text(textAlign:TextAlign.center,'Experience the',style: CustomTextStyle.poppins600style24.copyWith(fontSize:30),) ,
                    Text(textAlign:TextAlign.center,'Ultimate Car',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.deepAmperColor),) ,
                    Text(textAlign:TextAlign.center,'Wash',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.deepAmperColor),) ,
            ]
          )
        );
      }, animation: sliderTextAnimation,
    );
  }
  void _initSlidingAnimated() {
     animationController=AnimationController(vsync: this,duration:const Duration(seconds: 2));
    
     sliderTextAnimation =Tween<Offset>(begin:const Offset(-3, 0) ,end:Offset.zero ).animate(animationController);
       animationController.forward();
  }
}