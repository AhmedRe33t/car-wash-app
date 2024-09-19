import 'package:carwashing/features/standered_wash/presentation/model/date_time_model.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_overViewItemBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class overViewList extends StatelessWidget {
  const overViewList({super.key, required this.dateData});
  final  List<DateAndTime> dateData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
     
      child: ListView.builder(
        itemBuilder: (context,index){
        return overViewItemBuilder(model: dateData[index],);
      },
      itemCount:1,
      shrinkWrap: true,
      clipBehavior: Clip.none,
      ),
      
    );
  }
}