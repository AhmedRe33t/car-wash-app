import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/services/service_payment.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_appbar_standard.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_final_price.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_list_title.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_over_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 140.h,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const standered_screens(
            title: 'Standard wash',
            subTitle: 'Your Appointment',
          ),
        ),
        body: 
        CustomScrollView(slivers: [
         
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
          
          
            const SliverToBoxAdapter(
              child: CustomOverView(),
            ),
            const SliverToBoxAdapter(
              child: CustomListTitle(
                icon: Icons.location_city,
                text: 'Location:',
                trallingText: ' new_damitta',
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomListTitle(
                icon: Icons.calendar_view_day,
                text: 'payment_method:',
                trallingText: 'Apple pay',
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                indent: 10,
                endIndent: 10,
                thickness: 5,
              ),
            ),
            
       
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total price :',
                        style: CustomTextStyle.pacifico600style24
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      customPrice(model: context.read<ServiceCubit>().FinalListPrices, style: CustomTextStyle.pacifico600style24.copyWith(color:AppColors.deepAmperColor),)
                     
                    ]),
              ),
            ),
             SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
        child: QrImageView(
          data: '30', // The data you want to encode
          version: QrVersions.auto,    // Automatically adjusts the QR code version
          size: 200.0,                 // QR code size
        ),))
       
          ]),
        );
  }
}
