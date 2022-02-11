import 'dart:convert';

import 'package:http/http.dart' as http;


class FinalOrder_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_insert_final.php";
  static const INSERT_FINAL_ACTION = "INSERT_FINAL";

  static Future<String> insertFinal(String estimate_id, String final_price, String final_fee, String final_date) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = INSERT_FINAL_ACTION;
      map['estimate_id'] = estimate_id;
      map['final_price'] = final_price;
      map['final_fee'] = final_fee;
      map['final_date'] = final_date;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Insert Final Response : ${response.body}");
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }
}