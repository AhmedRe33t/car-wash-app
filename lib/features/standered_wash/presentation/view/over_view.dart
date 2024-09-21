import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/services/service_payment.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_appbar_standard.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_final_price.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_list_title.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_over_view.dart';
import 'package:carwashing/features/standered_wash/presentation/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverView extends StatelessWidget {
  const OverView({super.key});
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
            subTitle: 'Overview',
          ),
        ),
        body: 
        CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: CustomSliderThem(
                indexTop: 2,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding:
                  const EdgeInsets.only(top: 6, right: 30, left: 30, bottom: 0),
              child: Text(
                'standard wash',
                style: CustomTextStyle.poppins500style18
                    .copyWith(color: AppColors.primaryColor),
              ),
            )),
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
              child: SizedBox(
                height: 100.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'price:',
                        style: CustomTextStyle.poppins500style18
                            .copyWith(color: AppColors.primaryColor),
                      ),
                     // CustomOverView(),
                    customPrice(model: context.read<ServiceCubit>().FinalListPrices, style: CustomTextStyle.poppins500style18.copyWith(color:AppColors.primaryColor),),

                      
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loyality clubdiscount:',
                        style: CustomTextStyle.poppins500style18
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      Text(
                        '0%',
                        style: CustomTextStyle.poppins500style18
                            .copyWith(color: AppColors.primaryColor),
                      )
                    ]),
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
                        'Total:',
                        style: CustomTextStyle.pacifico600style24
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      customPrice(model: context.read<ServiceCubit>().FinalListPrices, style: CustomTextStyle.pacifico600style24.copyWith(color:AppColors.deepAmperColor),)
                      // Text(
                      //   '15\$',
                      //   style: CustomTextStyle.pacifico600style24
                      //       .copyWith(color: AppColors.amperColor),
                      // )
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: CustomBtn(
                  text: 'Book now ',
                  color: AppColors.amperColor,
              
                    onPressed: ()async {
      
    try {
  await PaymentManager.MakePayment(int.parse(getIt<CacheHelper>().getData(key: 'totalPrice')), 'usd');
  customNavigaeReplacement(context, path: '/homeNavBar');
} catch (e) {
 
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Payment failed. Please try again.'))
  );
}

                     
                  },
                ),
              ),
            )
          ]),
        );
  }
}
