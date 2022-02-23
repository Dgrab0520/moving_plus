import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/datas/alarm_setting_data.dart';

import '../models/notice_model.dart';

class NoticeData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_notice.php";

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  final _isNoticeLoading = false.obs;
  set isNoticeLoading(val) => _isNoticeLoading.value = val;
  bool get isNoticeLoading => _isNoticeLoading.value;

  final _notice = <Notice>[].obs;
  set notice(value) => _notice.value = value;
  List<Notice> get notice => _notice;

  final _isImportant = false.obs;
  set isImportant(val) => _isImportant.value = val;
  get isImportant => _isImportant.value;

  //공지사항 쓰기
  Future<String> putNotice(String title, String content, {File? file}) async {
    String imageName = getRandomString() + ".gif";
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "NOTICE_INSERT";
      request.fields['notice_id'] = getRandomString();
      request.fields['notice_title'] = title;
      request.fields['notice_content'] = content;
      request.fields['notice_type'] = isImportant.toString();
      if (file != null) {
        request.fields['notice_content_img'] = imageName;
        request.files
            .add(await http.MultipartFile.fromPath("noticeImage", file.path));
      }
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Notice Write Response : ${response.body}");
      if (response.statusCode == 200) {
        AlarmSettingData().sendAlarm();
        String result = response.body;
        return result;
      } else {
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }

  //공지사항 불러오기
  getNotice() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "NOTICE_SELECT";
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Notice> list = parseResponse(response.body);
        notice = list;
        isNoticeLoading = true;
      }
    } catch (e) {
      print(e);
      notice = <Notice>[];
      isNoticeLoading = true;
    }
  }

  static List<Notice> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Notice>((json) => Notice.fromJson(json)).toList();
  }
}
