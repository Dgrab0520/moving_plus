import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/pro_intro_model.dart';


class ProIntro_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_pro_select.php";
  static const SELECT_PRO_ACTION = "SELECT_PRO";


  //pro detail 정보 조회
  static Future<List<Pro_Intro>> getProIntro(String pro_id) async {
    print(pro_id);
    try{
      var map = Map<String, dynamic>();
      map['action'] = SELECT_PRO_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Pro Intro Response : ${response.body}');
      if(response.statusCode == 200){
        List<Pro_Intro> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  static List<Pro_Intro> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro_Intro>((json) => Pro_Intro.fromJson(json)).toList();
  }
}
