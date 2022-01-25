import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/models/chat_model.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString() => String.fromCharCodes(Iterable.generate(
    10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
final controller = Get.put(ReactiveController());

class ChatData {
  static const ROOT = "http://211.110.44.91/plus/plus_chat.php";
  static const LIST_ACTION = "LIST";
  static const WRITE_ACTION = "WRITE";

  //채팅 불러오기
  static Future<List<Chat>> getChat(int estimateId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = LIST_ACTION;
      map['estimateId'] = estimateId.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Chat List Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Chat> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //채팅쓰기
  static Future<List<String>> putChat(Chat chat, {File? file}) async {
    print(chat.text +
        "  " +
        chat.image +
        "  " +
        chat.isPro.toString() +
        "  " +
        chat.finalPrice.toString() +
        "  " +
        chat.customerId.toString() +
        "  " +
        chat.id.toString() +
        "  " +
        chat.estimateId.toString() +
        "  " +
        chat.proId.toString());
    String imageName = getRandomString() + ".gif";
    print(controller.pro.value.proPrimaryId.toString());
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = WRITE_ACTION;
      request.fields['estimateId'] = chat.estimateId.toString();
      request.fields['customerId'] = chat.customerId.toString();
      request.fields['proId'] = controller.pro.value.proPrimaryId.toString();
      request.fields['text'] = chat.text;
      request.fields['image'] = chat.image == "true" ? imageName : "";
      request.fields['finalPrice'] = chat.finalPrice.toString();
      request.fields['isPro'] = chat.isPro.toString();
      if (file != null) {
        request.files
            .add(await http.MultipartFile.fromPath("chatImage", file.path));
      }
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Chatting Response : ${response.statusCode}");
      if (response.statusCode == 200) {
        List<String> result = [response.body];
        if (file != null) result.add(imageName);
        return result;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static List<Chat> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Chat>((json) => Chat.fromJson(json)).toList();
  }
}
