import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_model.dart';

class Pro_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_pro.php";
  static const PRO_SELECT_ACTION = "PRO_SELECT";

  static Future<List<Pro>> getPro(String pro_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_SELECT_ACTION;
      map['pro_id'] = pro_id;
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

  static List<Pro> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro>((json) => Pro.fromJson(json)).toList();
  }
}