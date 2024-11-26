import 'package:chatty_app/pages/message/controller.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeadBar extends GetView<MessageController> {
  const HeadBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        // color: Colors.red,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  _customContainer(
                    child: controller.state.headDetail.value.avatar == null
                        ? //
                        Image.asset(
                            'assets/images/account_header.png',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          )
                        : const Text('Todo'),
                  ),
                  _buildStatusWidget()
                ],
              ),
              onTap: () {
                controller.goProfile();
              },
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildStatusWidget() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 18.w,
        height: 18.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          color: Colors.green.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _customContainer({required Widget child}) {
    return Container(
      width: 44.h,
      height: 44.h,
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryBackground,
        borderRadius: BorderRadius.circular(22.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
