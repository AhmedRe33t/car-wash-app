import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_cubit.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_state.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:carwashing/features/car_types/presentation/widgets/befor_statrt_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeforStartGetData extends StatelessWidget {
  const BeforStartGetData({
    super.key,
    // required this.carTypes,
    required this.selectedCar,
    required this.beforestart,
    required this.listCar,
  });

  //final List<Map<String, dynamic>> carTypes;
  final String? selectedCar;
  final CarTypesCubit beforestart;
  final List<CartypeModel> listCar;
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarTypesCubit, CarTypesState>(
      listener: (context, state) {
        if(state is GetCarTypesFaluire){
          showToast(state.errorMassege);
        }
      },
      builder: (context, state) {
        return 
        state is GetCarTypesLoading?const CustomShimmerCategory():
        SizedBox(
          height: 450.h,
          child: ListView.builder(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listCar.length,
            itemBuilder: (context, index) {
              
              return BeforStatrtItemBuilder(
                  selectedCar: selectedCar,
                  model: listCar[index],
                  beforestart: beforestart,
                   )
                  ;
            },
          ),
        );
      },
    );
  }
}
