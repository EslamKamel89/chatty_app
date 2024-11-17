import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.pacifico(
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryText,
    );
    return Container(
      margin: EdgeInsets.only(top: 50.h, bottom: 50.h),
      child: RichText(
        text: TextSpan(
          text: 'C',
          style: textStyle.copyWith(color: const Color(0xFF003f5c)),
          children: [
            TextSpan(
              text: 'h',
              style: textStyle.copyWith(color: const Color(0xF1003f5c)),
            ),
            TextSpan(
              text: 'a',
              style: textStyle.copyWith(color: const Color(0xFF2f4b7c)),
            ),
            TextSpan(
              text: 't',
              style: textStyle.copyWith(color: const Color(0xFF665191)),
            ),
            TextSpan(
              text: 't',
              style: textStyle.copyWith(color: const Color(0xFFa05195)),
            ),
            TextSpan(
              text: 'y',
              style: textStyle.copyWith(color: const Color(0xFFd45087)),
            ),
            TextSpan(
              text: ' .',
              style: textStyle.copyWith(color: const Color(0xFFf95d6a)),
            ),
            TextSpan(
              text: '.',
              style: textStyle.copyWith(color: const Color(0xFFff7c43)),
            ),
            TextSpan(
              text: '.',
              style: textStyle.copyWith(color: const Color(0xFF2d6a4f)),
            ),
          ],
        ),
      ),
    );
  }
}
