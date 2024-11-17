import 'package:chatty_app/utils/services/storage.dart';
import 'package:chatty_app/utils/store/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync(() => StorageService().init());
    Get.put(UserStore());
  }
}
