import 'package:carwashing/features/car_types/presentation-2/widgets/Before_Start_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Before_Start extends StatelessWidget {
  const Before_Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.w),
                bottomRight: Radius.circular(10.w))),
        title: Text(
          'Before we start!',
          style: TextStyle(
              color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 120.h,
        backgroundColor:const Color(0xff1B5276),
      ),
      body:const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: BeforeStartBody())
            ]),
    );
  }
}
