import 'package:get/get.dart';

class MainController extends GetxController {
  final _isAlarm = false.obs;
  final _isChat = false.obs;

  set isAlarm(value) => _isAlarm.value = value;
  get isAlarm => _isAlarm.value;

  set isChat(value) => _isChat.value = value;
  get isChat => _isChat.value;
}
