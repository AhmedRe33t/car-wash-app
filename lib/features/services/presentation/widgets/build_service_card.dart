import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/profile/data/models/profile_model.dart';
import 'package:carwashing/features/services/data/models/services_types.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_state.dart';
import 'package:carwashing/features/services/presentation/widgets/buil_point_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildServuceCaed extends StatelessWidget{
  BuildServuceCaed({super.key,  this.serviceName,
  // required this.pricesList, 
  required this.servicesList, 
  required this.model,   });
   String? serviceName;
  
  
  // final List<CartypeModel>pricesList;
   final List<ServicesTypes> servicesList;
     final ProfileDataMode model;
      
 
  @override

  Widget build(BuildContext context) {
   
 {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
         String? selected;
        if(state is ServiceSelected){
          selected=state.selectedService;
        }
      
        return state is GetServicesLoading?const CustomShimmerCategory(): SizedBox(
          height:450.h,
          child: ListView.separated(
            shrinkWrap:true,
              separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 6.h,),
              itemCount: 1,
             itemBuilder: (BuildContext context, int index) {
              return Column(
      children: [
        GestureDetector(
             onTap:()async{
               await context.read<ServiceCubit>().addFinalPrices(price:(model.carTypes[0].standard) );
               await getIt<CacheHelper>().saveData(key: 'totalPrice', value: model.carTypes[0].standard);
               context.read<ServiceCubit>().selectService(context.read<ServiceCubit>().servicesList[0].title );
             },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: selected==context.read<ServiceCubit>().servicesList[0].title ? BorderSide(color: Colors.blue, width: 2.0.w) : BorderSide.none,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.local_car_wash, size: 40.w,color: Colors.teal),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(servicesList[0].title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(), // Spacer
                    ),
                    // The price and radio button should be in a separate row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${model.carTypes[0].standard} \$', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.w),
                        Radio<String>(
                          value: servicesList[0].title,
                          groupValue:selected ,
                          onChanged: (value) {
                            context.read<ServiceCubit>().selectService(servicesList[0].title);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[0].dis1,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[0].dis2 ,),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[0].dis3 ,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[0].dis4 ,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
         
        ],
                  ),
                ),
              ),
            ),
            SizedBox(height:10.h),
              GestureDetector (
             onTap:() async {
              await context.read<ServiceCubit>().addFinalPrices(price:(model.carTypes[0].deluxe) );
              await getIt<CacheHelper>().saveData(key: 'totalPrice', value:model.carTypes[0].deluxe );
              context.read<ServiceCubit>().selectService(context.read<ServiceCubit>().servicesList[1].title );
             },
              child: Card(
                shape: RoundedRectangleBorder(
                 side:  selected==context.read<ServiceCubit>().servicesList[1].title  ? BorderSide(color: Colors.blue, width: 2.0.w) : BorderSide.none,
                  borderRadius: BorderRadius.circular(10.w),
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.card_membership, size: 40.w,color:Colors.red),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(servicesList[1].title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(), // Spacer
                    ),
                    // The price and radio button should be in a separate row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${model.carTypes[0].deluxe} \$' , style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.w),
                        Radio<String>(
                          value: servicesList[1].title,
                          groupValue:selected ,
                          onChanged: (value) {
                            context.read<ServiceCubit>().selectService(servicesList[1].title);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[1].dis1,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[1].dis2 ,),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[1].dis3 ,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[1].dis4 ,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
                  ),
                ),
              ),
            ),
             SizedBox(height:10.h),
              GestureDetector(
             onTap:() async {
              await context.read<ServiceCubit>().addFinalPrices(price:(model.carTypes[0].premium) );
               await getIt<CacheHelper>().saveData(key: 'totalPrice', value:model.carTypes[0].premium );
               context.read<ServiceCubit>().selectService(context.read<ServiceCubit>().servicesList[2].title );
             },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: selected==context.read<ServiceCubit>().servicesList[2].title  ? BorderSide(color: Colors.blue, width: 2.0.w) : BorderSide.none,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.fort, size: 40.w,color:Colors.deepOrangeAccent),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(servicesList[2].title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(), // Spacer
                    ),
                    // The price and radio button should be in a separate row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${model.carTypes[0].premium} \$' , style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.w),
                        Radio<String>(
                          value: servicesList[2].title,
                          groupValue: selected,
                          onChanged: (value) {
                            context.read<ServiceCubit>().selectService(servicesList[2].title);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[2].dis1,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[2].dis2 ,),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildPointIconText(text:servicesList[2].dis3 ,),
                          SizedBox(height: 4.h,),
                           BuildPointIconText(text:servicesList[2].dis4 ,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
                  ),
                ),
              ),
            ),
                
      ],
    );
              
              
              
              
              
              
          //     CardItem(serviceName: serviceName!, model:pricesList[index], price: '' ,  );
          //     },
                 
          // );
                }, 
              ),
        );
  });}

}

// class CardItem extends StatelessWidget {
}

