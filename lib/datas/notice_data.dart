import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  List<Notice> get notice => _notice.value;

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
