import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.content, required this.onTap});
  final String content;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        content,
        style: TextStyle(
          color: AppColors.primaryElement,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
