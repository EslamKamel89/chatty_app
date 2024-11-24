import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty_app/utils/entities/contact.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({super.key, required this.contactItem});
  final ContactItem contactItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        border: const Border(
            bottom: BorderSide(
          width: 1,
          color: AppColors.primarySecondaryBackground,
        )),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration:
                  BoxDecoration(color: AppColors.primarySecondaryBackground, shape: BoxShape.circle, boxShadow: [
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
                  return Image.asset(_getRandomImagePath());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getRandomImagePath() {
    String image = <String>[
      'person1.png',
      'person2.png',
      'person3.png',
      'person4.png',
      'person5.png',
    ][Random().nextInt(5)];
    return 'assets/images/$image';
  }
}
