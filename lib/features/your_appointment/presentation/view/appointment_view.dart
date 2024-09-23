import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
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
   Appointment({super.key});
  final int index = 0;
  bool isFinished=getIt<CacheHelper>().getData(key: 'orderFinished')??true;
  @override
  Widget build(BuildContext context) {
    return 
      isFinished ?
  // context.read<ServiceCubit>().finalListPrices== null?
     Padding(
       padding:const  EdgeInsets.symmetric(horizontal:16),
       child: Center(
         child: Container(
          height:400.h,
          
           decoration:const BoxDecoration(
            image:DecorationImage(image: AssetImage(Assets.imagesNoOrderHeartbreak,),fit:BoxFit.fill )
             )),
       ),
     ):
    
     Scaffold(
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
            SliverToBoxAdapter(
              child: CustomListTitle(
                icon: Icons.location_city,iconColor: Colors.yellow,
                text: 'Location-city:',
                trallingText:  '  ${getIt<CacheHelper>().getData(key: 'locationLa')}'
               // (key:'location' ,value:location)
               // ??' new_damitta',
              ),
            ),
             SliverToBoxAdapter(
              child: CustomListTitle(
                icon: Icons.location_city,iconColor: Colors.yellow,
                text: 'Location-street:',
                trallingText:  '  ${getIt<CacheHelper>().getData(key: 'locationLn')}'
               // (key:'location' ,value:location)
               // ??' new_damitta',
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomListTitle(
                icon: Icons.money,iconColor:Color.fromARGB(255, 11, 178, 53),
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
                      CustomPrice(model: context.read<ServiceCubit>().finalListPrices, style: CustomTextStyle.pacifico600style24.copyWith(color:AppColors.deepAmperColor),)
                     
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
