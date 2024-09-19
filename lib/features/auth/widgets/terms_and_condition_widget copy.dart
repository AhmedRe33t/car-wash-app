import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/features/auth/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'IHaveAgreeToOur ',
                  style: CustomTextStyle.poppins300style12.copyWith(color: AppColors.greyColor)),
              TextSpan(
                  text: 'termsAndCondition',
                  style: CustomTextStyle.poppins300style12
                      .copyWith(decoration: TextDecoration.underline,color: AppColors.amperColor)),
            ],
          ),
        ),
      ],
    );
  }
}
