import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_cubit.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:carwashing/features/services/data/models/prices_model.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class befor_statrt_item_builder extends StatelessWidget {
  const befor_statrt_item_builder({
    super.key,
    required this.selectedCar,
    required this.model,
    required this.beforestart,
  });

  final String? selectedCar;
  final CartypeModel model;
  final CarTypesCubit beforestart;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedCar == model.name ? Colors.orange : Colors.black,
          width: 2.0.w,
        ),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: ListTile(
        leading: Text(
          model.name,
          style: TextStyle(fontSize: 18.sp),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 90.w,
              height: 90.h,
              child: CachedNetworkImage(
                    imageUrl: model.image,
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
            Radio<String>(
              value: model.name,
              groupValue: selectedCar,
              onChanged: (value) {
                beforestart.selectCar(model.name);
                 //await context.read<CarTypesCubit>().addCarTypes(carType: model.name, carImage: model.image);
              },
            ),
          ],
        ),
        onTap: () async {
                          
        await context.read<CarTypesCubit>().addCarTypes(carType: model.name, carImage: model.image, 
         standard: model.standard, deluxe: model.deluxe, premium: model.premium,
        
        );
      
       
        beforestart.selectCar(model.name);

        },
      ),
    );
  }
}
