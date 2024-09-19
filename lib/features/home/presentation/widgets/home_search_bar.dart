import 'package:carwashing/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTextFormField(
      
      labelText:'Search',
      prefixIcon: Icon(Icons.search),
      suffixIcon:  Icon(Icons.list),
       );
  }
}