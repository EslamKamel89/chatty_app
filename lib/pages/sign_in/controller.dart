import 'package:chatty_app/utils/apis/apis.dart';
import 'package:chatty_app/utils/entities/entities.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:chatty_app/utils/routes/names.dart';
import 'package:chatty_app/utils/store/user.dart';
import 'package:chatty_app/utils/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid',
    ],
  );

  /// 1:email  2:google 3:facebook 4:apple 5:phone
  Future<void> handleSignIn(String type) async {
    final t = prt('handleSignin - SigninController - $type');
    try {
      if (type == "phone") {
        // TODO signin with phone
      } else if (type == 'google') {
        LoginRequestEntity? loginPanelListRequestEntity = await _signInWithGoogle();
        if (loginPanelListRequestEntity != null) {
          await asyncPostAllData(loginPanelListRequestEntity);
        } else {
          pr('Error occured loginPanelListRequestEntity is null', t);
        }
      } else if (type == 'facebook') {
        // TODO signin with facebook
      } else if (type == 'apple') {
        // TODO signin with apple
      }
    } catch (e) {
      if (e is DioException) {
        pr(e.response?.data, 't - Dio Exception Data');
      }
      pr('Exception: $e', t);
    }
  }

  Future<LoginRequestEntity?> _signInWithGoogle() async {
    final t = prt("_signInWithGoogle - SignInController");
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    pr(googleUser, '$t googl user');
    if (googleUser == null) return null;

    LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity(
      type: 2,
      name: googleUser.displayName,
      email: googleUser.email,
      avatar: googleUser.photoUrl ?? 'assets/icons/google.png',
      open_id: googleUser.id,
    );
    pr(loginPanelListRequestEntity, '$t - loginPanelListRequestEntity');
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: pr(googleAuth.accessToken, '$t - access token'),
      idToken: pr(googleAuth.idToken, '$t - id token'),
    );
    pr(credential, 't - GoogleAuthProvider.credential');
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    return loginPanelListRequestEntity;
  }

  asyncPostAllData(LoginRequestEntity loginPanelListRequestEntity) async {
    final t = prt('asyncPostAllData - SignInController');
    // UserStore.to.setIsLogin = true;
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    UserLoginResponseEntity response = await UserAPI.Login(params: loginPanelListRequestEntity);
    if (response.code == 0 && response.data != null) {
      await UserStore.to.saveProfile(response.data!);
      await EasyLoading.dismiss();
    } else {
      await EasyLoading.dismiss();
      toastInfo(msg: 'Internet Error');
    }
    pr(response, '$t - UserLoginResponseEntity');
    Get.offAllNamed(AppRoutes.Message);
  }
}
