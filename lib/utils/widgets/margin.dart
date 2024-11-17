import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalMargin extends StatelessWidget {
  const VerticalMargin({super.key, this.margin, required this.child});
  final double? margin;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 10.h),
      child: child,
    );
  }
}

class HorizontalMargin extends StatelessWidget {
  const HorizontalMargin({super.key, this.margin, required this.child});
  final double? margin;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 10.w),
      child: child,
    );
  }
}
