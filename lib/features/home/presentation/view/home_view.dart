import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/home/presentation/widgets/home_header.dart';
import 'package:carwashing/features/home/presentation/widgets/home_list_view.dart';
import 'package:carwashing/features/home/presentation/widgets/home_search_bar.dart';
import 'package:carwashing/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String searchQuary='';
  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),),

        const  SliverToBoxAdapter(child: home_view_header(),),
          SliverToBoxAdapter(child: Text('A clean car is ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:35),),),
           SliverToBoxAdapter(child: Text('a happy car ! ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:20),),),

           SliverToBoxAdapter(child: HomeSearchBar(onChanged:(value) {
            setState(() => 
              searchQuary=value);
           },),), 
          SliverToBoxAdapter(child: SizedBox(height: 30.h,),),

           SliverToBoxAdapter(child: Text('Our branches ', style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:15,fontWeight: FontWeight.bold),),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),

           SliverToBoxAdapter(child:HomeListView(searchQuary:searchQuary ,),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),

           SliverToBoxAdapter(child: Text('About us ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:16.sp),),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),

           SliverToBoxAdapter(child: HomeContaner(onPressed:() {
             customNavigate(context,path:'/AboutUsView');
           },text1: 'About Us', text2: 'We are car wash apllication...', text3: 'Book now',img:Assets.imagesCarwash, gradient:const LinearGradient(colors:[Color.fromARGB(255, 9, 57, 95),Color.fromARGB(255, 33, 86, 130),Color.fromARGB(255, 220, 35, 35),Color.fromARGB(255, 152, 33, 24)]),)),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
           SliverToBoxAdapter(child: Text('your appourtment ',style: CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:16.sp),),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),

           SliverToBoxAdapter(child: HomeContaner(onPressed:() {
             customNavigate(context,path:'/Oppointment');
           },text1: 'Your Appointment', text2: 'show your appointment info...', text3: 'Show Now',img:Assets.imagesAppountmentJpg, gradient: LinearGradient(colors:[Color.fromARGB(255, 9, 57, 95),Color.fromARGB(255, 83, 134, 145),Color(0xff5AB0C3)]),),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),

          
        



          
        ],
      ),
    );
  }
}
