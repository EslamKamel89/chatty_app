import 'package:chatty_app/utils/entities/contact.dart';
import 'package:chatty_app/utils/utils/http.dart';

class ContactAPI {
  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      'auth/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }
}
