import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/home/presentation/widgets/home_list_view.dart';
import 'package:carwashing/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
          SliverToBoxAdapter(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Hey Mark',style: CustomTextStyle.poppins500style18,),const Icon(Icons.notifications)],),),
          SliverToBoxAdapter(child: Text('A clean car is a ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor),),),
           SliverToBoxAdapter(child: Text('happy car ! ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor),),),
          const SliverToBoxAdapter(child: HomeSearchBar(),),
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
          const SliverToBoxAdapter(child: Text('services '),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child:HomeListView(),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child: Text('your appourtment '),),
          const SliverToBoxAdapter(child: HomeContaner(text1: 'you dont have any', text2: 'car wash oppoinment yet...', text3: 'Book now',),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child: HomeContaner(text1: 'you dont have any', text2: 'car wash oppoinment yet...', text3: 'Book now',),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child: HomeContaner(text1: 'you dont have any', text2: 'car wash oppoinment yet...', text3: 'Book now',),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child: HomeContaner(text1: 'you dont have any', text2: 'car wash oppoinment yet...', text3: 'Book now',),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),





          
        ],
      ),
    );
  }
}

class HomeContaner extends StatelessWidget {
  const HomeContaner({super.key, required this.text1, required this.text2, required this.text3});
 final String text1;
  final String text2;
    final String text3;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(16) ,
        gradient:const LinearGradient(colors:[AppColors.primaryColor,Colors.blue,AppColors.primaryColor])
      ),
      child: Stack(
        children: [Positioned(
          left: 10.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Text(text1,style: CustomTextStyle.poppins300style12,),
              SizedBox(height: 2.h,),
              Text(text2,style: CustomTextStyle.poppins300style12),
             SizedBox(height: 10.h,),
              SizedBox(
                height: 40.h,
                width: 120.h,
                child: CustomBtn(
                  color: AppColors.deepAmperColor,
                  text:text3, style: CustomTextStyle.poppins300style12,))
          
          
            ],
          ),
        ),
          Positioned(
            top: 0,
            left: 220,
            bottom: 0,
            right: 0,
            child: Image.asset(Assets.imagesCoolestCarsFeature,fit: BoxFit.fill,))
      ]),
    );
  }
}
