import 'package:http/http.dart' as http;

import 'chat_data.dart';

class RecomData {
  static const ROOT = "http://211.110.44.91/plus/plus_recom.php";

  //추천인 등록
  static Future<bool> insertRecom(String recom) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "RECOM_INSERT";
      map['recom'] = recom;
      map['cus_id'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Insert Recom Response : ${response.body}');
      if (200 == response.statusCode) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("exception : $e");
      return false;
    }
  }

  //추천인 코드 조회
  static Future<bool> isRecom(String recom) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "RECOM_SELECT";
      map['recom'] = recom;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Recom Response : ${response.body}');
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
      return false;
    }
  }

  //추천인 등록 횟수 조회
  static Future<bool> getRecomCount() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "RECOM_COUNT";
      map['cus_id'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Recom Count Response : ${response.body}');
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
      return false;
    }
  }

  //해당 추천인 등록 검사
  static Future<bool> existsRecom(String recom) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "RECOM_EXISTS";
      map['recom'] = recom;
      map['cus_id'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Recom Exists Response : ${response.body}');
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
      return false;
    }
  }
}
