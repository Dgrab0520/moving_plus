import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/controllers/main_alarm_controller.dart';
import 'package:moving_plus/models/alarm_model.dart';

class AlarmData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_alarm.php";
  static const LIST_ACTION = "LIST";
  static const WRITE_ACTION = "WRITE";
  static const DELETE_ACTION = "DELETE";

  final _alarms = <Alarm>[].obs;
  final _isAlarmLoad = false.obs;

  alarmDelete(int index) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = DELETE_ACTION;
      map['id'] = _alarms[index].id.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Alarm Delete Response : ${response.body}');

      if (response.statusCode == 200) {
        _alarms.removeAt(index);
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  alarmCount(String receiverName) async {
    print("receiverName : $receiverName");
    final mainController = Get.put(MainController());
    try {
      var map = <String, dynamic>{};
      map['action'] = "COUNT";
      map['receiverName'] = receiverName;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Alarm Count Response : ${response.body}');

      if (response.statusCode == 200) {
        if (int.parse(jsonDecode(response.body)) > 0) {
          mainController.isAlarm = true;
        }
      } else {}
    } catch (e) {
      print("exception : $e");
    }
  }

  get isAlarmLoad => _isAlarmLoad.value;
  set isAlarmLoad(value) => _isAlarmLoad.value = value;

  List<Alarm> get alarms => _alarms.value;
  set alarms(value) => _alarms.value = value;

  //알람 불러오기
  getAlarm() async {
    final controller = Get.put(ReactiveController());
    String receiverName = controller.pro.value.type == "cus"
        ? controller.pro.value.pro_id
        : controller.pro.value.pro_name;
    print(controller.pro.value.pro_id);
    print(receiverName);
    try {
      var map = <String, dynamic>{};
      map['action'] = LIST_ACTION;
      map['receiverName'] = receiverName;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Alarm Response : ${response.body}');

      if (response.statusCode == 200) {
        alarms = parseResponse(response.body);
        isAlarmLoad = true;
      }
    } catch (e) {
      print("exception : $e");
      isAlarmLoad = true;
    }
  }

  //알람입력
  static Future<List<String>> putChat(
      String callerName, List<dynamic> receiverName, String alarmType,
      {String? order_id, String? mainType}) async {
    print(jsonEncode(receiverName));
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = WRITE_ACTION;
      request.fields['callerName'] = callerName;
      request.fields['receiverName'] = jsonEncode(receiverName);
      request.fields['alarmType'] = alarmType;
      if (order_id != null) {
        request.fields['order_id'] = order_id;
        request.fields['mainType'] = mainType!;
      }
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Alarm Write Response : ${response.body}");
      if (response.statusCode == 200) {
        List<String> result = [response.body];
        return result;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static List<Alarm> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Alarm>((json) => Alarm.fromJson(json)).toList();
  }
}
