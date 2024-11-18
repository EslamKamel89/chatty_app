import 'package:chatty_app/pages/profile/index.dart';
import 'package:chatty_app/pages/profile/view/widgets/user_profile_photo.dart';
import 'package:chatty_app/utils/values/colors.dart';
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
                  child: const Column(
                children: [
                  UserProfilePhoto(),
                ],
              )),
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
