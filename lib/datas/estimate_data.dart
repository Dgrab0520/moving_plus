import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EstimateData{
  static const ROOT = "http://211.110.44.91/plus/plus_estimate_insert.php";
  static const INSERT_ESTIMATE_ACTION = "INSERT_ESTIMATE";

  static Future<String> insertEstimate(String estimate_id, String estimate_price, String estimate_detail) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = INSERT_ESTIMATE_ACTION;
      map['estimate_id'] = estimate_id;
      map['estimate_price'] = estimate_price;
      map['estimate_detail'] = estimate_detail;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Insert Estimate Response : ${response.body}');
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