import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moving_plus/models/customer_model.dart';

class Customer_Data {
  static const ROOT = "http://211.110.44.91/plus/plus_customer.php";
  static const CUSTOMER_SELECT_ACTION = "CUSTOMER_SELECT";
  static const CUSTOMER_INSERT_ACTION = "CUSTOMER_INSERT";
  static const CUSTOMER_TOKEN_ACTION = "CUSTOMER_TOKEN";
  static const SELECT_TOKEN_ACTION = "SELECT_TOKEN";

  //고객 정보 조회
  static Future<List<Customer>> get_Customer(String user_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CUSTOMER_SELECT_ACTION;
      map['user_id'] = user_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Customer Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Customer> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //신규 고객 저장
  static Future<String> insertCustomer(String cus_id, String cus_recom) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CUSTOMER_INSERT_ACTION;
      map['cus_id'] = cus_id;
      map['cus_recom'] = cus_recom;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('New Customer Insert : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //고객 토큰 저장
  static Future<String> updateToken(String cus_id, String token) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CUSTOMER_TOKEN_ACTION;
      map['cus_id'] = cus_id;
      map['token'] = token;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Customer Token Update : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //고객 토큰 불러오기
  static Future<String> getCustomerToken(String user_id) async {
    print(user_id);
    try {
      var map = <String, dynamic>{};
      map['action'] = SELECT_TOKEN_ACTION;
      map['user_id'] = user_id;
      print(map);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select token Response : ${response.body}');

      if (response.statusCode == 200) {
        String result = response.body.replaceAll("\n", "");
        print(result);
        return result;
      } else {
        print(response.reasonPhrase);
        return "";
      }
    } catch (e) {
      print("exception : $e");
      return "";
    }
  }

  static List<Customer> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Customer>((json) => Customer.fromJson(json)).toList();
  }
}
