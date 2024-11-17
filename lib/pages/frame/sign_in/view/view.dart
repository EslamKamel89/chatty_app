import 'package:chatty_app/pages/frame/sign_in/index.dart';
import 'package:chatty_app/pages/frame/sign_in/view/widgets/custom_text_button.dart';
import 'package:chatty_app/pages/frame/sign_in/view/widgets/logo_widget.dart';
import 'package:chatty_app/pages/frame/sign_in/view/widgets/or_divider.dart';
import 'package:chatty_app/pages/frame/sign_in/view/widgets/social_login_button.dart';
import 'package:chatty_app/utils/values/colors.dart';
import 'package:chatty_app/utils/widgets/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const LogoWidget(),
          SocialLoginButton(
              imagePath: 'assets/icons/google.png',
              content: 'Sign in with Google',
              onTap: () {
                controller.handleSignIn('google');
              }),
          const SocialLoginButton(
            imagePath: 'assets/icons/facebook.png',
            content: 'Sign in with Facebook',
          ),
          const SocialLoginButton(
            imagePath: 'assets/icons/apple.png',
            content: 'Sign in with Apple',
          ),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(content: 'Log In', onTap: () {}),
              Text(
                " By Mobile",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have an Account ",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              CustomTextButton(content: 'Sign Up', onTap: () {}),
            ],
          ),
        ].map((w) => VerticalMargin(child: w)).toList(),
      ),
    );
  }
}
