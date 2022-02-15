import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_model.dart';

class Pro_Data extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_pro.php";
  static const PRO_SELECT_ACTION = "PRO_SELECT";
  static const PRO_ALLIANCE_ACTION = "PRO_ALLIANCE";
  static const PRO_BEST_ACTION = "PRO_ACTION";
  static const PRO_TOKEN_ACTION = "PRO_TOKEN";
  static const PRO_CHECK_ACTION = "PRO_CHECK";
  static const SELECT_PRO_TOKEN_ACTION = "SELECT_PRO_TOKEN";
  static const PRO_UPDATE_ACTION = "PRO_UPDATE";

  List<Pro> proAlli = [];
  final _isAlliLoading = false.obs;
  get isAlliLoading => _isAlliLoading.value;
  set isAlliLoading(val) => _isAlliLoading.value = val;

  List<Pro> proBest = [];
  final _isBestLoading = false.obs;
  get isBestLoading => _isBestLoading.value;
  set isBestLoading(val) => _isBestLoading.value = val;

  final _pro = <Pro>[].obs;
  final _isProLoading = false.obs;

  List<Pro> get pro => _pro.value;
  set pro(val) => _pro.value = val;

  get isProLoading => _isProLoading.value;
  set isProLoading(val) => _isProLoading.value = val;

  //제휴 파트너(인기 Badge) -> 일반 전문가 순으로 모든 전문가 조회
  get_Pro(String condition) async {
    print("isProLoading : $isProLoading");
    isProLoading = false;
    print("isProLoading : $isProLoading");
    try {
      var map = Map<String, dynamic>();
      map['action'] = PRO_SELECT_ACTION;
      map['condition'] = condition;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Pro> list = parseResponse(response.body);
        isProLoading = true;
        pro = list;

        print(pro);
        print(isProLoading);
      }
    } catch (e) {
      print(e);
      isProLoading = true;
      pro = <Pro>[];
    }
  }

  //제휴 파트너(인기 Badge) 추천
  getPro_Alli() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = PRO_ALLIANCE_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro_Alli Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Pro> list = parseResponse(response.body);
        proAlli = list;
        isAlliLoading = true;
      }
    } catch (e) {
      print(e);
    }
  }

  //일반 전문가 추천
  getPro_Best() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = PRO_BEST_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro_Best Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Pro> list = parseResponse(response.body);
        proBest = list;
        isBestLoading = true;
      }
    } catch (e) {
      print(e);
    }
  }

  //전문가 토큰 저장
  static Future<String> updatePro(
      String pro_id,
      String intro,
      String pro_name,
      String service_type1,
      String service_type2,
      String service_type3,
      String service_type4,
      String service_type5,
      String pro_area1,
      String pro_area2,
      String pro_area3,
      String pro_career,
      String pro_pay) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = PRO_UPDATE_ACTION;
      map['pro_id'] = pro_id;
      map['intro'] = intro;
      map['pro_name'] = pro_name;
      map['service_type1'] = service_type1;
      map['service_type2'] = service_type2;
      map['service_type3'] = service_type3;
      map['service_type4'] = service_type4;
      map['service_type5'] = service_type5;
      map['pro_area1'] = pro_area1;
      map['pro_area2'] = pro_area2;
      map['pro_area3'] = pro_area3;
      map['pro_career'] = pro_career;
      map['pro_pay'] = pro_pay;
      print(map);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Pro Update : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //전문가 토큰 저장
  static Future<String> updateToken_Pro(String pro_id, String token) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = PRO_TOKEN_ACTION;
      map['pro_id'] = pro_id;
      map['token'] = token;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Pro Token Update : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //전문가 회원가입 중복확인
  static Future<String> CheckPro(String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = PRO_CHECK_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Check Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //해당 서비스, 지역 프로 토큰 불러오기
  static Future<Map<String, dynamic>> selectProToken(
      String service_type, String area) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = SELECT_PRO_TOKEN_ACTION;
      map['service_type'] = service_type;
      map['area'] = area;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Pro Token Select : ${response.body}");
      if (200 == response.statusCode) {
        Map<String, dynamic> body = jsonDecode(response.body);
        print(body['token']);
        return {"token": body['token'], "name": body['name']};
      } else {
        return {};
      }
    } catch (e) {
      print("exception : $e");
      return {};
    }
  }

  static List<Pro> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro>((json) => Pro.fromJson(json)).toList();
  }
}
