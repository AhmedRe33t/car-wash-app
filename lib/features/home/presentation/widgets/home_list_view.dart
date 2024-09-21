import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/features/home/data/car_branches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListView extends StatelessWidget {
   HomeListView({super.key, required this.searchQuary});
   final String searchQuary;
final List<CarBranches> branches =
 [
CarBranches(img:Assets.imagesFrist ,name: 'Damietta'),
CarBranches(img:Assets.imagesSec ,name: 'Cairo'),
CarBranches(img:Assets.imagesThird ,name: 'Giza'),
CarBranches(img:Assets.imagesFourth ,name: 'Portsaid'),
CarBranches(img:Assets.imagesFifth ,name: 'Portfoad'),
CarBranches(img:Assets.imagesSexth ,name: 'Porto'),
CarBranches(img:Assets.imagesSeventh ,name: 'AL-Mansoura'),
 ];
  @override
  Widget build(BuildContext context) {
    final result= branches.where((i){
      return i.name.toLowerCase().contains(searchQuary.toLowerCase());
    }).toList();
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return  Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(result[index].img),
                radius: 40.r,
              ),
            Text(result[index].name,style:CustomTextStyle.poppins600style24.copyWith(color: AppColors.primaryColor,fontSize:12.sp),),
            ],
          );
        }, 
        separatorBuilder: (context,index)=>SizedBox(width: 6.w,), 
        itemCount: result.length,
        ),
    );
  }
}