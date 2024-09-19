import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomSliderText extends StatelessWidget {
  const CustomSliderText(
      {super.key, required this.title, required this.subTitle});
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style:CustomTextStyle.poppins500style18.copyWith
          (
            color: AppColors.blackColor
          )
        ),
        SizedBox(
          height: height * .02,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.start,
          style:CustomTextStyle.poppins500style18.copyWith
          (
            color: AppColors.blackColor
          )
        ),
      ],
    );
  }
}
