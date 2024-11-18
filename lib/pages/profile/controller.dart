import 'package:chatty_app/pages/profile/state.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:chatty_app/utils/store/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();

  final ProfileState state = ProfileState();
  Future<void> signOut() async {
    const t = 'signOut - ProfileController';
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      await UserStore.to.onLogout();
      pr('User logged out successfully');
    } catch (e) {
      pr('Exception occured: $e', t);
    }
  }
}
