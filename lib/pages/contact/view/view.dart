import 'package:chatty_app/pages/contact/index.dart';
import 'package:chatty_app/pages/contact/view/widgets/contact_list.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: const ContactList(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Contact',
        style: TextStyle(color: AppColors.primaryText, fontSize: 16.sp),
      ),
    );
  }
}
