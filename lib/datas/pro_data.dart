import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_model.dart';

class Pro_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_pro.php";
  static const PRO_SELECT_ACTION = "PRO_SELECT";
  static const PRO_ALLIANCE_ACTION = "PRO_ALLIANCE";
  static const PRO_BEST_ACTION = "PRO_ACTION";
  static const PRO_TOKEN_ACTION = "PRO_TOKEN";


  //제휴 파트너(인기 Badge) -> 일반 전문가 순으로 모든 전문가 조회
  static Future<List<Pro>> get_Pro(String condition) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_SELECT_ACTION;
      map['condition'] = condition;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Pro> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }



  //제휴 파트너(인기 Badge) 추천
  static Future<List<Pro>> getPro_Alli() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_ALLIANCE_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro_Alli Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Pro> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }


  //일반 전문가 추천
  static Future<List<Pro>> getPro_Best() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_BEST_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro_Best Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Pro> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }


  //전문가 토큰 저장
  static Future<String> updateToken_Pro(String pro_id, String token) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_TOKEN_ACTION;
      map['pro_id'] = pro_id;
      map['token'] = token;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Pro Token Update : ${response.body}");
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }

  static List<Pro> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro>((json) => Pro.fromJson(json)).toList();
  }
}