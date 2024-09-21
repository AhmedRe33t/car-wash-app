
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContaner extends StatelessWidget {
   HomeContaner({super.key,this.onPressed, required this.text1, required this.text2, required this.text3, required this.img,required this.gradient});
 final String text1;
  final String text2;
    final String text3;
final String img;
 void Function()? onPressed;
 final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
         Container(
        height: 120.h,
        width:double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(16) ,
          gradient: gradient
          // LinearGradient(colors:[Color.fromARGB(255, 9, 57, 95),Color.fromARGB(255, 33, 86, 130),Color.fromARGB(255, 220, 35, 35),Color.fromARGB(255, 152, 33, 24)])
        ),
       child:Padding(
         padding:  EdgeInsets.only(right:200.w,top:30.h),
         
       )
         ),
         Positioned(
          bottom:10,
          left:10,
           child: SizedBox(
                      height: 40.h,
                      width: 120.h,
                      child: CustomBtn(
                        color: AppColors.deepAmperColor,
                        text:text3, style: CustomTextStyle.poppins300style12,
                        onPressed:onPressed
                        
                        
                        )
                        ),
         ),
            Positioned(
            left: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Text(text1,style: CustomTextStyle.poppins300style12.copyWith(fontSize:20.sp)),
                SizedBox(height: 2.h,),
                Text(text2,style: CustomTextStyle.poppins300style12.copyWith(color:Colors.white.withOpacity(0.6))),
               SizedBox(height: 10.h,),
               
            
              ],
            ),
          ),
            Positioned(
              top: 0,
              left: 220,
              bottom: 0,
              right: 0,
              child: Image.asset(img,fit: BoxFit.fill,))
        
    
       
      ]
    );
  }
}
