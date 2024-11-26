import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.imagePath, required this.content, this.onTap});
  final void Function()? onTap;
  final String imagePath;
  final String content;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240.0.w,
        height: 50.0.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imagePath, // Ensure you have a Google logo asset
              height: 24.0.w,
              width: 24.0.w,
            ),
            SizedBox(width: 20.0.w),
            Text(
              content,
              style: TextStyle(
                fontSize: 16.0.sp,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
