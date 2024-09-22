import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/services/data/models/prices_model.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice({super.key, required this.model, required this.style});
  final List<CarPrices> model;
  final TextStyle style;
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
       if(state is GetPricrsFaluer ){
        showToast(state.message);
       }
      },
      builder: (context, state) {
        return state is GetPricrsLoading?const CustomShimmerCategory():
         Text('${model[0].price} \$',style:style
         //const TextStyle(color:AppColors.deepAmperColor,fontSize: 20)
         );
      },
    );
  }
}
