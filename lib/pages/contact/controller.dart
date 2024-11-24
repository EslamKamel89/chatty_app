import 'package:chatty_app/pages/contact/index.dart';
import 'package:chatty_app/utils/apis/apis.dart';
import 'package:chatty_app/utils/entities/contact.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  ContactController();

  final ContactState state = ContactState();

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
}
