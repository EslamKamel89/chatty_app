import 'dart:io';

import 'package:chatty_app/utils/entities/base.dart';
import 'package:chatty_app/utils/entities/chat.dart';
import 'package:chatty_app/utils/utils/http.dart';
import 'package:dio/dio.dart';

class ChatAPI {
  static Future<BaseResponseEntity> bind_fcmtoken({BindFcmTokenRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/bind_fcmtoken',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> call_notifications({CallRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/send_notice',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> call_token({CallTokenRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/get_rtc_token',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> send_message({ChatRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/message',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> upload_img({File? file}) async {
    String fileName = file!.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    var response = await HttpUtil().post(
      'api/upload_photo',
      data: data,
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<SyncMessageResponseEntity> sync_message({SyncMessageRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/sync_message',
      queryParameters: params?.toJson(),
    );
    return SyncMessageResponseEntity.fromJson(response);
  }
}
