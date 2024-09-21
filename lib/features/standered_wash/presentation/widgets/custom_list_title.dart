import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({super.key, required this.icon, required this.text, required this.trallingText, this.iconColor});
  final IconData icon;
  final String text;
    final String trallingText;
    final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,right: 6,left: 6,bottom: 6),
      child: ListTile(
        leading: Icon(icon,color:iconColor),
        title: Text(text,style: CustomTextStyle.poppins300style12.copyWith(color: AppColors.greyColor),),
        trailing: Text(trallingText,style: CustomTextStyle.poppins300style12.copyWith(color: Colors.black),),
      ),
    );
  }
}