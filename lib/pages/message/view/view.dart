import 'package:chatty_app/pages/message/index.dart';
import 'package:chatty_app/pages/message/view/widgets/headbar.dart';
import 'package:chatty_app/utils/routes/names.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HttpUtil().get('/test').then((response) => pr(response, 'response'));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              const CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    // backgroundColor: AppColors.primaryElement,
                    pinned: true,
                    title: HeadBar(),
                  )
                ],
              ),
              Positioned(
                right: 20.w,
                bottom: 70.w,
                // height: 50.w,
                // width: 50.w,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.Contact);
                  },
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.circular(50.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/icons/contact.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
