import 'package:carwashing/features/services/data/models/prices_model.dart';
import 'package:carwashing/features/services/data/models/services_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_state.dart';

// ServiceCubit definition
class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  void selectService(String serviceName) {
    emit(ServiceSelected(serviceName));
  }

 


List<ServicesTypes> servicesList=[];
  getServicesTypes()async{
    emit(GetServicesLoading());
  try {
  await FirebaseFirestore.instance.collection('services').get().then((value){
    value.docs.forEach((elemnt){
          servicesList.add(ServicesTypes.fromJson(elemnt.data()));
    });
    emit(GetServicesSuccess());
  });
} on Exception catch (e) {
  emit(GetServicesFaluer(message: e.toString()));
}
  }


 addFinalPrices({
   required String price
   })async{
    emit((AddPricrsLoading()));
   try {
  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('finalPrice').doc('pLjH87mQIWV9kEPAryqA').set({
  'price':price

  });
  emit(AddPricrsSuccess());
} on Exception catch (e) {
   emit(AddPricrsFaluer( message: e.toString()));
}
   }
 List<CarPrices>finalListPrices=[];
  getFinalPrices()async{
    emit(GetPricrsLoading());
   try {
   finalListPrices=[];
  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('finalPrice').get().then((value){
       value.docs.forEach((element){
           finalListPrices.add(CarPrices.fromJson(element.data()));
       });
       emit(GetPricrsSuccess());
  });

} on Exception catch (e) {

  emit(GetPricrsFaluer(message: e.toString()));
}
  }

}


