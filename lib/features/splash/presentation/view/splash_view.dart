import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/splash/presentation/widgets/custom_button_splash.dart';
import 'package:carwashing/features/splash/presentation/widgets/custom_splash_image.dart';
import 'package:carwashing/features/splash/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  initState(){
    bool isLogin=getIt<CacheHelper>().getData(key: 'logSuccess')??false;
    isLogin? path='/homeNavBar':path='/signInView';
    super.initState();
  

  }
   String path='/signInView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
               backgroundColor: AppColors.primaryColor,
               body: Padding(
                 padding:const EdgeInsets.symmetric(horizontal: 16.0),
                 child: CustomScrollView(
                     slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 140.h,),),
                      
                     const SliverToBoxAdapter(child:CustomTitle() ,),
                      SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
                      const SliverToBoxAdapter(child: CustomSplashImage(),),
                      SliverToBoxAdapter(child: SizedBox(height: 100.h,),),
                       SliverToBoxAdapter(child:CustomSplashButton(path: path,)
                      ,),
                      

                      
                     ],
                 )
                 
                 
                 
               
               ),
    );
  }
}
