import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_state.dart';

import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_state.dart';
import 'package:carwashing/features/services/presentation/widgets/build_service_card.dart';
import 'package:carwashing/features/services/presentation/widgets/service_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesView extends StatelessWidget {
  

 const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
         
        },
        builder: (context, state) {
          return state is GetProfileDataLoading?const CustomShimmerCategory(): Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: ServiceHeader(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BuildServuceCaed(
                      
                      servicesList: context.read<ServiceCubit>().servicesList,
                      // pricesList: context.read<CarTypesCubit>().carTypes, 
                       model: context.read<ProfileCubit>().listProfileData[0],
                    ),
                  ),

          
                                              SliverToBoxAdapter(child: SizedBox(height: 5.h,),),

           
                                              SliverToBoxAdapter(child: SizedBox(height: 5.h,),),

         
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<ServiceCubit, ServiceState>(
                      builder: (context, state) {
                        bool isServiceSelected = state is ServiceSelected;
                        return CustomBtn(
                          text: isServiceSelected
                              ? 'Book Now'
                              : 'select your service',
                          onPressed: () {
                            isServiceSelected
                                ? customNavigaeReplacement(
                                    context,
                                    path:
                                        '/datetimeview', /*param1: state.selectedService*/
                                  )
                                : null;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }



 
}
