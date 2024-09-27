
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:carwashing/features/profile/data/models/profile_model.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<ProfileDataMode> listProfileData=[];
  List<CartypeModel> listCarTypes=[];
  getUserDtat()async{
 try {
  emit(GetProfileDataLoading());
      listProfileData=[];
      await getCarTypeList();
  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
   value.data();
     listProfileData.add(ProfileDataMode.fromJson(value.data(), listCarTypes));
     emit(GetProfileDataSuccess());
   },
   
   );
} on Exception catch (e) {
  emit(GetProfileDataFaluire(errorMassge: e.toString()));
}
  }
 Future<void> getCarTypeList()async{
   await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('carTypes').get().then((value)=>
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
  
