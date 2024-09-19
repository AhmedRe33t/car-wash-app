// before_start_body.dart

import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_cubit.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_state.dart';
import 'package:carwashing/features/car_types/presentation-2/widgets/befor_start_get_data.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeforeStartBody extends StatelessWidget {
  const BeforeStartBody({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarTypesCubit, CarTypesState>(
      builder: (context, state) {
        String? selectedCar;
        CarTypesCubit beforestart = context.read<CarTypesCubit>();
        if (state is BeforeStartPageSuccess) {
          selectedCar = state.selectedCar;
        }

        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 90.w, left: 20.w, top: 20.h),
              width: double.infinity,
              height: 100.h,
              child: Text(
                'Select your car type so we can adjust our prices for you',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
        
            // Car types list
        
            befor_start_get_data(
              selectedCar: selectedCar,
              beforestart: beforestart,
              listCar: context.read<CarTypesCubit>().carTypes,
           
            ),
        
            // Additional info
            Container(
              padding: EdgeInsets.only(right: 16.w, left: 20.w, top: 20.h),
              width: double.infinity,
              height: 100.h,
              child: Text(
                '* The size of the vehicle significantly influences the price of the car washing services.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
        
            // Save button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 188, 116, 8),
                  ),
                ),
                onPressed: () {
                  getIt<CacheHelper>().saveData(key: 'logSuccess',value:true);
                    customNavigaeReplacement(context,path: '/homeNavBar');
                },
                
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


