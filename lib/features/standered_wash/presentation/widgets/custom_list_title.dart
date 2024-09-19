import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({super.key, required this.icon, required this.text, required this.trallingText});
  final IconData icon;
  final String text;
    final String trallingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,right: 30,left: 30,bottom: 0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text,style: CustomTextStyle.poppins300style12.copyWith(color: AppColors.greyColor),),
        trailing: Text(trallingText,style: CustomTextStyle.poppins300style12.copyWith(color: Colors.black),),
      ),
    );
  }
}