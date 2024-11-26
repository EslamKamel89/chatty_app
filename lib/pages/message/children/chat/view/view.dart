import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty_app/pages/message/children/chat/index.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:chatty_app/utils/widgets/random_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(
              controller.state.toName.value,
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: const TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            );
          }),
          actions: [
            Obx(
              () {
                return Container(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: CachedNetworkImage(
                          imageUrl: controller.state.toAvatar.value,
                          fit: BoxFit.cover,
                          errorWidget: (context, path, _) {
                            return const RandomAvatar();
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15.w,
                          height: 15.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.lightGreenAccent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 1,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 1),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
