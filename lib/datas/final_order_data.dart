import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moving_plus/models/final_order_model.dart';
import 'package:moving_plus/models/payment_model.dart';

import 'chat_data.dart';

class FinalOrder_Data {
  static const ROOT = "http://211.110.44.91/plus/plus_insert_final.php";
  static const INSERT_FINAL_ACTION = "INSERT_FINAL";
  static const SELECT_FINAL_ACTION = "SELECT_FINAL";
  static const SELECT_PAYMENT_ACTION = "SELECT_PAYMENT";
  static const UPDATE_STATUS_ACTION = "UPDATE_STATUS";

  static Future<String> insertFinal(String estimate_id, String final_price,
      String final_fee, String final_date) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = INSERT_FINAL_ACTION;
      map['estimate_id'] = estimate_id;
      map['pro_id'] = controller.pro.value.pro_id;
      map['final_price'] = final_price;
      map['final_fee'] = final_fee;
      map['final_date'] = final_date;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Insert Final Response : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Finals>> selectFinals(String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_FINAL_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Select Final Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Finals> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<Payment>> selectPayment(String estimate_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_PAYMENT_ACTION;
      map['estimate_id'] = estimate_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Select Final Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Payment> list = parseResponse2(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<String> updateStatus(String estimate_id) async {
    print(estimate_id);
    try {
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_STATUS_ACTION;
      map['estimate_id'] = estimate_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Update Status Response : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static List<Finals> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Finals>((json) => Finals.fromJson(json)).toList();
  }

  static List<Payment> parseResponse2(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Payment>((json) => Payment.fromJson(json)).toList();
  }
}
