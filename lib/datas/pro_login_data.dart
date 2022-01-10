import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_login_model.dart';

class Pro_Login_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_pro_login.php";
  static const PRO_LOGIN_ACTION = "PRO_LOGIN";

  static Future<List<Pro_Info>> getPro_Login(String pro_id, String pro_pw) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_LOGIN_ACTION;
      map['pro_id'] = pro_id;
      map['pro_pw'] = pro_pw;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Login Response : ${response.body}');

      if(response.statusCode == 200){
        List<Pro_Info> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return[];
    }
  }

  static List<Pro_Info> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro_Info>((json) => Pro_Info.fromJson(json)).toList();
  }
}