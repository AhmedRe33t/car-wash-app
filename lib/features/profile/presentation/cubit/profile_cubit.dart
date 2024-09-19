
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:carwashing/features/profile/data/models/profile_model.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_state.dart';
import 'package:carwashing/features/services/data/models/prices_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<ProfileDataMode> listProfileData=[];
  List<CartypeModel> listCarTypes=[];
  // List<CarPrices> listPrices=[];
  getUserDtat()async{
 try {
  emit(GetProfileDataLoading());
      listProfileData=[];
  await FirebaseFirestore.instance.collection('users').get().then((value){
   value.docs.forEach((element)async {
    await getCarTypeList(element);
     listProfileData.add(ProfileDataMode.fromJson(element.data(), listCarTypes));
     emit(GetProfileDataSuccess());
   },
   
   );});
} on Exception catch (e) {
  emit(GetProfileDataFaluire(errorMassge: e.toString()));
}
  }
 Future<void> getCarTypeList(QueryDocumentSnapshot<Map<String, dynamic>> element)async{
   await FirebaseFirestore.instance.collection('users').doc(element.id).collection('carTypes').get().then((value)=>
    value.docs.forEach((element){
      listCarTypes.add(CartypeModel.fromJson(element.data()));
    })
    
    );
  }
  selectCar(String name,String image,String premium,String deluxe,String standard)async{
   await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('carTypes').doc(FirebaseAuth.instance.currentUser!.uid).set({
     'name': name,
     'image':image,
     'Premium':premium,
     'deluxe':deluxe,
     'standard':standard

     
    });
    
    
  }
}
  
