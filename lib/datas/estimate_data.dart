import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moving_plus/models/estimate_model.dart';

class EstimateData {
  static const ROOT = "http://211.110.44.91/plus/plus_estimate_insert.php";
  static const INSERT_ESTIMATE_ACTION = "INSERT_ESTIMATE";
  static const INSERT_CHAT_ACTION = "INSERT_CHAT";
  static const SELECT_ESTIMATE_ACTION = "SELECT_ESTIMATE";
  static const SELECT_RECORD_ACTION = "SELECT_RECORD";

  //견적서 보내기
  static Future<String> insertEstimate(String pro_id, String customer_id, String estimate_id,
      String order_id, String estimate_price, String estimate_detail) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = INSERT_ESTIMATE_ACTION;
      map['pro_id'] = pro_id;
      map['customer_id'] = customer_id;
      map['estimate_id'] = estimate_id;
      map['order_id'] = order_id;
      map['estimate_price'] = estimate_price;
      map['estimate_detail'] = estimate_detail;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Insert Estimate Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //견적서 chat_table에 저장
  static Future<String> insertEstimate_Chat(
      String estimateId,
      String customerId,
      String proId,
      String text,
      String estimatePrice) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = INSERT_CHAT_ACTION;
      map['estimateId'] = estimateId;
      map['customerId'] = customerId;
      map['proId'] = proId;
      map['text'] = text;
      map['estimatePrice'] = estimatePrice;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Insert Estimate Chat Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //견적서 조회
  static Future<List<Estimate>> getEstimate(String order_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_ESTIMATE_ACTION;
      map['order_id'] = order_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Estimate Response : ${response.body}');
      if (response.statusCode == 200) {
        List<Estimate> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //견적 이력 조회
  static Future<List<Estimate>> getEstimate_record(
      String order_id, String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_RECORD_ACTION;
      map['order_id'] = order_id;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Record Response : ${response.body}');
      if (response.statusCode == 200) {
        List<Estimate> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static List<Estimate> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Estimate>((json) => Estimate.fromJson(json)).toList();
  }
}
