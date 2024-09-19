import 'package:carwashing/features/car_types/data/carType_model.dart';

class ProfileDataMode{
  final String email;
  final String image;
  final String name;
  final String phone;
  final List<CartypeModel> carTypes;
  

  ProfileDataMode({required this.carTypes,required this.email, required this.image, required this.name, required this.phone,});
  factory ProfileDataMode.fromJson(jsonDta,listCarTypes){
     return ProfileDataMode(
      email:jsonDta['email'] ,
      image: jsonDta['image'],
      name:jsonDta['name'] , 
      phone:jsonDta['phone'] ,
      carTypes: listCarTypes
      
      );
      
  }
}