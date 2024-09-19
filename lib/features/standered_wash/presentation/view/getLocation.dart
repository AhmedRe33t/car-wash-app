import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/Map_builder.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_appbar_standard.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Getlocation extends StatelessWidget {
  const Getlocation({super.key});

  @override
  Widget build(BuildContext context) {
    LatLng? userPos;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const standered_screens(
          title: 'Standard wash',
          subTitle: 'Choose your location',
        ),
        toolbarHeight: 100.h,
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CustomSliderThem(indexTop: 1)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 400.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.blackColor),
                child: MapScreen(
                  onLocationSelected: (LatLng position) {
                    userPos = position;
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: CustomBtn(
                text: 'Next',
                color: AppColors.amperColor,
                onPressed: () {
                 
                    // Use the selected position (userPos) here
                    //print('Selected Position: ${userPos!.latitude}, ${userPos!.longitude}');
                    customNavigate(context, path: '/overview');
                  
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
