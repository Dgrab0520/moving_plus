import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_model.dart';

class Pro_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_pro.php";
  static const PRO_ALLIANCE_ACTION = "PRO_ALLIANCE";
  static const PRO_BEST_ACTION = "PRO_ACTION";

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

  static List<Pro> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro>((json) => Pro.fromJson(json)).toList();
  }
}