
import 'package:carwashing/features/profile/presentation/widgets/profile_view_header.dart';
import 'package:carwashing/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, });
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
              slivers: [
   const   SliverToBoxAdapter(child: profile_view_header()),
      SliverToBoxAdapter(child: SizedBox(height: 32.h,)),
     const SliverToBoxAdapter(child: profile_view_body( ),),
      SliverToBoxAdapter(child: SizedBox(height: 32.h,)),
      //SliverToBoxAdapter(child:),


    ])));
  }
}
