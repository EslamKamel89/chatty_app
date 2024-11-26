import 'package:chatty_app/pages/message/children/chat/index.dart';
import 'package:chatty_app/utils/helpers/print_helper.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();

  final ChatState state = ChatState();
  late String docId;
  @override
  void onInit() {
    final t = prt('onInit - ChatController');
    super.onInit();
    Map<String, String?> data = pr(Get.parameters, '$t - Route recieved paramaters recieved');
    docId = data['docId'] ?? '';
    state.docId.value = data['docId'] ?? '';
    state.toToken.value = data['toToken'] ?? '';
    state.toName.value = data['toName'] ?? '';
    state.toAvatar.value = data['toAvatar'] ?? '';
    state.toOnline.value = data['toOnline'] ?? '';
  }
}
