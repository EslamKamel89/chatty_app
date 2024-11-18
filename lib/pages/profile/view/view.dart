import 'package:chatty_app/pages/profile/index.dart';
import 'package:chatty_app/pages/profile/view/widgets/user_profile_photo.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:chatty_app/utils/widgets/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    const UserProfilePhoto(),
                    const Sizer(),
                    MainButton(
                      onTap: () {},
                      content: 'Complete',
                    ),
                    const Sizer(),
                    MainButton(
                      onTap: () {
                        Get.defaultDialog(
                          title: 'Are You Sure!!!',
                          onConfirm: () async {
                            await controller.signOut();
                            // Get.
                          },
                          onCancel: () {},
                          textConfirm: 'Confirm',
                          confirmTextColor: Colors.white,
                          textCancel: 'Cancel',
                          content: const SizedBox(),
                        );
                      },
                      content: 'Log Out',
                      color: AppColors.primarySecondaryElementText,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Profile',
        style: TextStyle(
          fontSize: 18.sp,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    required this.content,
    this.color,
  });
  final void Function()? onTap;
  final String content;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 295.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryElement,
            borderRadius: BorderRadius.circular(5.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                ),
              )
            ],
          )),
    );
  }
}
