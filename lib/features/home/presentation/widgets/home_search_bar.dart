import 'package:carwashing/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
   HomeSearchBar({super.key,this.onChanged});
   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      onChanged:onChanged,
      labelText:'Search',
      prefixIcon: Icon(Icons.search),
      suffixIcon:  Icon(Icons.list),
      
       );
  }
}