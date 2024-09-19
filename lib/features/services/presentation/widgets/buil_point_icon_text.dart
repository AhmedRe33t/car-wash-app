import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPointIconText extends StatelessWidget{
  BuildPointIconText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, size: 16.sp, color: Colors.green),
        SizedBox(width: 5.w),
        Expanded(child: Text(text, style: TextStyle(fontSize: 12.sp))),
      ],
    );
  }

}