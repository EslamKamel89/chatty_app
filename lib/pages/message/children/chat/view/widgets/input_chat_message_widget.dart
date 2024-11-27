import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputChatMessageWidget extends StatelessWidget {
  const InputChatMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          _buildCard(
            child: Row(
              children: [
                Container(
                    width: 220.w,
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      // width: 370,
      // height: 50.h,
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        border: Border.all(color: AppColors.primarySecondaryElementText),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: child,
    );
  }
}
