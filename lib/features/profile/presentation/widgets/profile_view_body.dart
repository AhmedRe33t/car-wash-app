import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_state.dart';
import 'package:carwashing/features/profile/data/models/profile_model.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_state.dart';
import 'package:carwashing/features/profile/presentation/widgets/Setting_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class profile_view_body extends StatelessWidget {
  const profile_view_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetProfileDataFaluire) {
            showToast(state.errorMassge);
          }
        },
        //CustomProfileBuilder(model: context.read<ProfileCubit>().listProfileData[index]
        builder: (context, state) {
          return state is GetProfileDataLoading
              ? const CustomShimmerCategory()
              : CustomProfileBuilder(
                  model: context.read<ProfileCubit>().listProfileData[0],
                );
        },
      ),
    );
  }
}

class CustomProfileBuilder extends StatelessWidget {
  const CustomProfileBuilder({
    super.key,
    required this.model,
  });

  final ProfileDataMode model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColors.whiteColor,
          elevation: 10,
          // margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: model.image ??
                        'https://firebasestorage.googleapis.com/v0/b/car-wash-3252a.appspot.com/o/coolest-cars-feature.webp?alt=media&token=eaf2e03a-1302-4b89-b73d-a393423502ba',
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.greyColor,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: AppColors.greyColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: CustomTextStyle.poppins300style12.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                    Text(
                      model.email,
                      style: CustomTextStyle.poppins300style12.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          children: [
            Text(
              'Car Type',
              style: CustomTextStyle.poppins500style18.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Card(
          elevation: 5,
          shadowColor: AppColors.deepAmperColor,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: CachedNetworkImage(
                  imageUrl: model.carTypes[0].image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.greyColor,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: AppColors.greyColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                model.carTypes[0].name,
                style: CustomTextStyle.poppins500style18.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 80.w,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.amperColor)),
                onPressed: () {
                  customNavigate(context, path: '/beforeStartBody');
                },
                child: const Text(
                  'Change',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          children: [
            Text(
              'Settings',
              style: CustomTextStyle.poppins500style18.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
              ),
            ),
          ],
        ),
        Setting_item_listtile(
            icon:const Icon(Icons.edit),
            title: 'Edit Profile',
            color: AppColors.blueColor),
       
        Setting_item_listtile(
            icon: const Icon(Icons.workspace_premium),
            title: 'Loyality Club',
            color: AppColors.amperColor),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is SignOutFailureState){
              showToast(state.errMessage);
            }
            if(state is SignOutSuccessState){
                  getIt<CacheHelper>().removeData(key: 'logSuccess');
                  getIt<CacheHelper>().removeData(key: 'orderFinished');
                  
                  customNavigaeReplacement(context,path:'/signInView' );
            }
          },
          builder: (context, state) {
            return Setting_item_listtile(
                onTap: ()async {
                await  context.read<AuthCubit>().logOut();
                },
                icon:const Icon(Icons.logout),
                title: 'Log Out',
                color: Colors.red);
          },
        ),
      ],
    );
  }
}
