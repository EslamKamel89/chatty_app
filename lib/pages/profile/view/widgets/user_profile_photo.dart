import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePhoto extends StatelessWidget {
  const UserProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customContainer(
          child: Image.asset(
            'assets/images/account_header.png',
            fit: BoxFit.cover,
          ),
        ),
        _customIconButton(
          onTap: () {},
        )
      ],
    );
  }

  Positioned _customIconButton({required void Function()? onTap}) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(35.w),
          ),
          child: Image.asset('assets/icons/edit.png'),
        ),
      ),
    );
  }

  Widget _customContainer({required Widget child}) {
    return Container(
      width: 120.w,
      height: 120.w,
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryBackground,
        borderRadius: BorderRadius.circular(60.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
