import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/alarm_setting_data.dart';
import 'package:moving_plus/datas/chat_data.dart';

class AlarmSettings extends GetxController {
  final _isPush = true.obs;
  final _isNotice = true.obs;
  final _isDisturb = false.obs;

  set isPush(bool value) => _isPush.value = value;
  bool get isPush => _isPush.value;
  set isNotice(bool value) => _isNotice.value = value;
  bool get isNotice => _isNotice.value;
  set isDisturb(bool value) => _isDisturb.value = value;
  bool get isDisturb => _isDisturb.value;

  final _selectedTimeFrom = TimeOfDay.now().obs;
  final _selectedTimeTo = TimeOfDay.now().obs;

  TimeOfDay get selectedTimeFrom => _selectedTimeFrom.value;
  set selectedTimeFrom(val) => _selectedTimeFrom.value = val;

  TimeOfDay get selectedTimeTo => _selectedTimeTo.value;
  set selectedTimeTo(val) => _selectedTimeTo.value = val;

  selectFromTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    selectedTimeFrom = pickedTime;
    const storage = FlutterSecureStorage();
    await storage.write(
        key: "TimeFrom",
        value: "${selectedTimeFrom.hour}:${selectedTimeFrom.minute}");
    print("${selectedTimeFrom.hour}:${selectedTimeFrom.minute}");
  }

  selectToTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeTo,
    );
    selectedTimeTo = pickedTime;

    const storage = FlutterSecureStorage();
    await storage.write(
        key: "TimeTo",
        value: "${selectedTimeTo.hour}:${selectedTimeTo.minute}");
    print("${selectedTimeTo.hour}:${selectedTimeTo.minute}");
  }

  getAlarmSettings() async {
    print("settings");
    const storage = FlutterSecureStorage();

    await storage.read(key: "isPush").then((value) {
      if (value != null) {
        isPush = value.toLowerCase() == "true";
      } else {
        isPush = true;
      }
    });
    await storage.read(key: "isNotice").then((value) {
      if (value != null) {
        isNotice = value.toLowerCase() == "true";
      } else {
        isNotice = true;
      }
    });
    await storage.read(key: "isDisturb").then((value) {
      if (value != null) {
        isDisturb = value.toLowerCase() == "false";
      } else {
        isDisturb = false;
      }
      if (isDisturb) {
        String from = "";
        String to = "";
        storage.read(key: "TimeFrom").then((value) {
          if (value != null) {
            from = value;
          } else {
            from = "${DateTime.now().hour}:${DateTime.now().minute}";
          }
          print("from : $from");
          selectedTimeFrom = TimeOfDay(
              hour: int.parse(from.split(":")[0]),
              minute: int.parse(from.split(":")[1]));
        });
        storage.read(key: "TimeTo").then((value) {
          if (value != null) {
            to = value;
          } else {
            to = "${DateTime.now().hour}:${DateTime.now().minute}";
          }
          print("to : $to");
          selectedTimeTo = TimeOfDay(
              hour: int.parse(to.split(":")[0]),
              minute: int.parse(to.split(":")[1]));
        });
      }
    });
    print("isPush : $isPush");
    print("isNotice : $isNotice");
    print("isDisturb : $isDisturb");
  }

  setAlarmSetting(String alarmType, bool exists) async {
    switch (alarmType) {
      case "isPush":
        isPush = exists;
        break;
      case "isNotice":
        isNotice = exists;
        AlarmSettingData().updateAlarmSetting(controller.pro.value.type,
            controller.pro.value.pro_id, exists ? 1 : 0);
        break;
      case "isDisturb":
        isDisturb = exists;
        break;
    }
    print("type : $alarmType, exists : $exists");

    const storage = FlutterSecureStorage();
    await storage.write(key: alarmType, value: exists.toString());
  }
}
