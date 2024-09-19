import 'package:carwashing/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return  Column(
            children: [
              CircleAvatar(
                backgroundImage:const AssetImage(Assets.imagesCoolestCarsFeature),
                radius: 40.r,
              ),
            const  Text('car')
            ],
          );
        }, 
        separatorBuilder: (context,index)=>SizedBox(width: 6.w,), 
        itemCount: 10),
    );
  }
}