import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'alarm_data.dart';

class AlarmSettingData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_alarm_setting.php";

  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendFCM',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 5)));

  sendAlarm() async {
    List<dynamic> tokenList = [];
    List<dynamic> nameList = [];

    try {
      var map = <String, dynamic>{};
      map['action'] = "SELECT_NOTICE";
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Alarm Setting Select Response : ${response.body}');

      if (response.statusCode == 200) {
        tokenList = jsonDecode(response.body)['token'];
        nameList = jsonDecode(response.body)['id'];
      }
    } catch (e) {
      print(e);
    }

    print("tokenList : $tokenList");
    AlarmData.putChat("admin", nameList, "notice");

    final HttpsCallableResult result = await callable.call(
      <String, dynamic>{
        "token": tokenList,
        "title": "공지사항",
        "body": "새로운 공지사항이 있습니다",
      },
    );
    print(result);
  }

  //알람 세팅
  updateAlarmSetting(String isPro, String id, int isReceive) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "SET_NOTICE";
      map['isPro'] = isPro;
      map['id'] = id;
      map['receiveNotice'] = isReceive.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Update Alarm Setting Select Response : ${response.body}');

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
