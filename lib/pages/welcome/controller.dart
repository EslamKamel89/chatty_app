import 'package:chatty_app/pages/welcome/state.dart';
import 'package:chatty_app/utils/routes/names.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  final title = 'Chatty.';
  final WelcomeState state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Get.offAllNamed(AppRoutes.Message),
    );
  }
}
