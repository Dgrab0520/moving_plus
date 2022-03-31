import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/models/chat_model.dart';
import 'package:moving_plus/models/chat_room_model.dart';
import 'package:moving_plus/models/user_chat_room_model.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString() => String.fromCharCodes(Iterable.generate(
    10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
final controller = Get.put(ReactiveController());

List<ChatRoom> chatRoom = [];
List<UserChatRoom> userChatRooms = [];

class ChatData {
  static const ROOT = "http://211.110.44.91/plus/plus_chat.php";
  static const LIST_ACTION = "LIST";
  static const WRITE_ACTION = "WRITE";
  static const CHAT_LIST_ACTION = "CHAT_LIST";
  static const USER_CHAT_LIST_ACTION = "USER_CHAT_LIST";
  static const CUS_CHECK_ACTION = 'CUS_CHECK';

  //전문가일때 채팅목록 불러오기
  static Future<List<ChatRoom>> getChatList(
      String proId, String serviceType) async {
    print(proId);
    try {
      var map = <String, dynamic>{};
      map['action'] = CHAT_LIST_ACTION;
      map['proId'] = proId;
      map['serviceType'] = serviceType;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Chat List Response : ${response.body}');

      if (response.statusCode == 200) {
        List<ChatRoom> list = chatRoomParseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //전문가일때 개인 문의 채팅목록 불러오기
  static Future<List<ChatRoom>> getPersonalChatList(String proId) async {
    print(proId);
    try {
      var map = <String, dynamic>{};
      map['action'] = "CHAT_LIST_PERSONAL";
      map['proId'] = proId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Personal Chat List Response : ${response.body}');

      if (response.statusCode == 200) {
        List<ChatRoom> list = chatRoomParseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //고객일때 채팅목록 불러오기
  static Future<List<UserChatRoom>> getUserChatList(String orderId) async {
    print(orderId);
    try {
      var map = <String, dynamic>{};
      map['action'] = USER_CHAT_LIST_ACTION;
      map['order_id'] = orderId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('User Chat List Response : ${response.body}');

      if (response.statusCode == 200) {
        List<UserChatRoom> list = userChatRoomParseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //고객일때 개인 문의 채팅목록 불러오기
  static Future<List<UserChatRoom>> getUserPersonalChatList(
      String userId) async {
    print(userId);
    try {
      var map = <String, dynamic>{};
      map['action'] = "USER_CHAT_LIST_PERSONAL";
      map['userId'] = userId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('User Personal Chat List Response : ${response.body}');

      if (response.statusCode == 200) {
        List<UserChatRoom> list = userChatRoomParseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //채팅 불러오기
  static Future<List<Chat>> getChat(String estimateId) async {
    print("estimateId : $estimateId");
    try {
      var map = <String, dynamic>{};
      map['action'] = LIST_ACTION;
      map['estimateId'] = estimateId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Chat Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Chat> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  //고객 채팅 여부 확인
  static Future<List<Chat>> check_Cus(String estimateId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CUS_CHECK_ACTION;
      map['estimateId'] = estimateId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Customer Chat Response : ${response.body}");
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
  static Future<List<String>> putChat(Chat chat, String type,
      {File? file}) async {
    print(chat.text +
        "  " +
        chat.image +
        "  " +
        chat.isPro.toString() +
        "  " +
        chat.finalPrice.toString() +
        "  " +
        chat.id.toString() +
        "  " +
        chat.estimateId.toString());
    String imageName = getRandomString() + ".gif";
    print(controller.pro.value.id);
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = WRITE_ACTION;
      request.fields['estimateId'] = chat.estimateId.toString();
      request.fields['text'] = chat.text;
      request.fields['image'] = chat.image == "true" ? imageName : "";
      request.fields['finalPrice'] = chat.finalPrice.toString();
      request.fields['chatType'] = type;
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

  //채팅방 나가기
  static Future<bool> exitChat(String estimateId) async {
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "EXIT_CHAT";
      request.fields['estimateId'] = estimateId;
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Exit Chat Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static List<Chat> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Chat>((json) => Chat.fromJson(json)).toList();
  }

  static List<ChatRoom> chatRoomParseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ChatRoom>((json) => ChatRoom.fromJson(json)).toList();
  }

  static List<UserChatRoom> userChatRoomParseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<UserChatRoom>((json) => UserChatRoom.fromJson(json))
        .toList();
  }
}
