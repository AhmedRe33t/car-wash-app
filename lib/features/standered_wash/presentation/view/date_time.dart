import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_state.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_appbar_standard.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_date_time.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeView extends StatelessWidget {
  const DateTimeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const standered_screens(
          title: 'Standard wash',
          subTitle: 'Pick date and time',
        ),
        toolbarHeight: 140.h,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomSliderThem(
              indexTop: 0,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Select your date and time',
              style: CustomTextStyle.poppins500style18
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'select days when wash is available',
              style: CustomTextStyle.poppins500style18,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomDateAndTime(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BlocConsumer<DateTimeCubit, DateTimeState>(
                listener: (context, state) {
                   if(state is AddDateAndTimeFaluire){
                    showToast(state.errorMassage);
                   }
                },
                builder: (context, state) {
                  return
                  
                  state is AddDateAndTimeLoading?const CircularProgressIndicator(color: AppColors.deepAmperColor,):
                  
                   CustomBtn(
                    text: 'Next ',
                    color: AppColors.amperColor,
                    onPressed: () {
                      context.read<DateTimeCubit>().addDateAndTime(datePicker: dateController.text, timePicker: timeController.text);
                      customNavigate(context, path: '/mapsView');
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
