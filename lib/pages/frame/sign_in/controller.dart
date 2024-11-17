import 'package:chatty_app/utils/entities/entities.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:chatty_app/utils/routes/names.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final t = 'handleSignin - SigninController - $type';
    try {
      if (type == "phone") {
        // TODO signin with phone
      } else if (type == 'google') {
        await _signInWithGoogle();
        asyncPostAllData();
      } else if (type == 'facebook') {
        // TODO signin with facebook
      } else if (type == 'apple') {
        // TODO signin with apple
      }
    } catch (e) {
      pr('Exception: $e', t);
    }
  }

  Future _signInWithGoogle() async {
    const t = "_signInWithGoogle - SignInController";
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity(
      type: 2,
      name: googleUser.displayName,
      email: googleUser.email,
      avatar: googleUser.photoUrl ?? 'assets/icons/google.png',
      open_id: googleUser.id,
    );
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: pr(googleAuth.accessToken, '$t - access token'),
      idToken: pr(googleAuth.idToken, '$t - id token'),
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  asyncPostAllData() {
    Get.offAllNamed(AppRoutes.Message);
  }
}
