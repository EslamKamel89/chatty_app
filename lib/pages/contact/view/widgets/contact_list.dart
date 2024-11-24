import 'package:chatty_app/pages/contact/controller.dart';
import 'package:chatty_app/pages/contact/view/widgets/contact_list_item.dart';
import 'package:chatty_app/utils/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.state.contactList.length,
                (context, index) {
                  ContactItem contact = controller.state.contactList[index];

                  return ContactListItem(contactItem: contact);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
