import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Divider()),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.w), child: const Text('OR')),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
