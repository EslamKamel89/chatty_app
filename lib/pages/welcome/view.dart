import 'package:chatty_app/pages/frame/sign_in/view/widgets/logo_widget.dart';
import 'package:chatty_app/pages/welcome/index.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildPageHeadTitle(String title) {
    return const LogoWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryElement.withOpacity(0.1),
      body: Center(
        // width: double.infinity,
        // height: double.infinity,
        // alignment: Alignment.center,
        child: _buildPageHeadTitle(controller.title),
      ),
    );
  }
}
