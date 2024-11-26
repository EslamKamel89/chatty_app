import 'package:chatty_app/utils/entities/entities.dart';
import 'package:get/get.dart';

class ChatState {
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;
  RxString docId = ''.obs;
  RxString toToken = ''.obs;
  RxString toName = ''.obs;
  RxString toAvatar = ''.obs;
  RxString toOnline = ''.obs;
}
