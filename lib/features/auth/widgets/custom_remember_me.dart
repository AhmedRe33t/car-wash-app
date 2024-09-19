import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRememberMe extends StatefulWidget {
  const CustomRememberMe({super.key, });

  @override
  State<CustomRememberMe> createState() => _CustomRememberMeState();
}

class _CustomRememberMeState extends State<CustomRememberMe> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: context.read<AuthCubit>().checkBoxValue, 
        onChanged:(value){
          setState(() {
                      context.read<AuthCubit>().checkBoxValue= value;

          });
        } ),
       const Text('Remmber me')
      ],
    );
  }
}