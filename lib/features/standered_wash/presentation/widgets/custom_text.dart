import 'package:carwashing/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  CustomText({super.key, required this.model, });
  final ProfileDataMode model;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(model.carTypes[0].premium);
  }

}