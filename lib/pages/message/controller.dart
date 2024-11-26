import 'package:chatty_app/pages/message/index.dart';
import 'package:chatty_app/utils/routes/names.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();
  final state = MessageState();
  void goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
