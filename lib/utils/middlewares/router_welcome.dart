import 'package:chatty_app/utils/routes/names.dart';
import 'package:chatty_app/utils/store/config.dart';
import 'package:chatty_app/utils/store/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Message);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
