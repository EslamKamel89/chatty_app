import 'package:chatty_app/pages/contact/index.dart';
import 'package:chatty_app/utils/apis/apis.dart';
import 'package:chatty_app/utils/entities/contact.dart';
import 'package:chatty_app/utils/entities/msg.dart';
import 'package:chatty_app/utils/entities/user.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:chatty_app/utils/store/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  ContactController();

  final ContactState state = ContactState();
  final token = UserStore.to.getToken();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  Future<void> asyncLoadAllData() async {
    final t = prt('asyncLoadAllData - ContactController');
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    state.contactList.clear();
    ContactResponseEntity contactResponseEntity = await ContactAPI.post_contact();
    pr(contactResponseEntity, t);
    if (contactResponseEntity.code == 0) {
      state.contactList.addAll(contactResponseEntity.data ?? []);
    }
    EasyLoading.dismiss();
  }

  Future goChat(ContactItem contactItem) async {
    final t = prt('goChat - ContactController');
    pr(contactItem, '$t - contactItem');
    pr(token, '$t - current user token ');

    /// current user messages
    QuerySnapshot<Msg> fromMessages = await db
        .collection('message')
        .withConverter<Msg>(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where('from_token', isEqualTo: token) //
        .where('to_token', isEqualTo: contactItem.token) //
        .get();

    /// ohter user messages
    QuerySnapshot<Msg> toMessages = await db
        .collection('message')
        .withConverter<Msg>(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where('from_token', isEqualTo: contactItem.token) //
        .where('to_token', isEqualTo: token) //
        .get();

    if (fromMessages.docs.isEmpty && toMessages.docs.isEmpty) {
      UserItem profile = UserStore.to.profile;
      Msg(
        from_token: profile.token,
        to_token: contactItem.token,
        from_name: profile.name,
        to_name: contactItem.name,
        from_avatar: profile.avatar,
        to_avatar: contactItem.avatar,
        from_online: int.parse(profile.online ?? '0'),
        to_online: contactItem.online,
        last_msg: '',
        last_time: Timestamp.now(),
        msg_num: 0,
      );
    }
  }
}
