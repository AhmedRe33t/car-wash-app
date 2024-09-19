
import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, path:"/forgotPassword");
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'forgotPassword',
          style: CustomTextStyle.poppins300style12.copyWith(color: AppColors.primaryColor)),
        ),
      
    );
  }
}
