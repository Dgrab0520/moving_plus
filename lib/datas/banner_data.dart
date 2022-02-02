import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/banner_model.dart';

class Banner_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_banner_select.php";
  static const BANNER_SELECT_ACTION = "BANNER_SELECT";
  static const BANNER_SUB_SELECT_ACTION = "BANNER_SUB_ACTION";

  static Future<List<Banners>> getBanner_Main() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = BANNER_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Banners> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  static Future<List<Banners>> getBanner_Sub() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = BANNER_SUB_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner_Sub Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Banners> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  static List<Banners> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Banners>((json) => Banners.fromJson(json)).toList();
  }
}