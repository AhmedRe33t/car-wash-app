import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_state.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_show_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOverView extends StatelessWidget {
  const CustomOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DateTimeCubit,DateTimeState>( 
      listener: (context,state){
      if (state is AddDateAndTimeFaluire){
        showToast(state.errorMassage);
      }
      },
    
    builder: (context,state){
      return state is GeyDateAndTimeLoadint? const CustomShimmerCategory():
      
       overViewList(dateData:context.read<DateTimeCubit>().dateTimeData ,);
    },
    );
  }
}