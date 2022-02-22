import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AlarmSettings extends GetxController {
  final _isPush = true.obs;
  final _isNotice = true.obs;
  final _isDisturb = true.obs;

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
        isDisturb = value.toLowerCase() == "true";
      } else {
        isDisturb = true;
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
