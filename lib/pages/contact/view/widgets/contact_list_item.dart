import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty_app/pages/contact/controller.dart';
import 'package:chatty_app/utils/entities/contact.dart';
import 'package:chatty_app/utils/extensions/capitalize.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:chatty_app/utils/widgets/random_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactListItem extends GetView<ContactController> {
  const ContactListItem({super.key, required this.contactItem});
  final ContactItem contactItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: ElevatedButton(
        onPressed: () {
          controller.goChat(contactItem);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _userImage(),
              SizedBox(width: 10.w),
              Text(
                (contactItem.name ?? '').toCapitalize,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 15.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userImage() {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(color: AppColors.primarySecondaryBackground, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 2,
          spreadRadius: 1,
          offset: const Offset(0, 1),
        ),
      ]),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: contactItem.avatar ?? '',
        errorWidget: (context, str, obj) {
          return const RandomAvatar();
        },
      ),
    );
  }
}
