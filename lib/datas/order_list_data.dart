import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moving_plus/models/order_chat_model.dart';
import 'package:moving_plus/models/order_model.dart';

import '../main.dart';

class OrderList_Data {
  static const ROOT = "http://211.110.44.91/plus/select_order.php";
  static const GET_ORDER_ACTION = "GET_ORDER";
  static const GET_CUS_ACTION = "GET_CUS";
  static const GET_EACH_ORDER = "EACH_ORDER";
  static const GET_USER_ORDER_ACTION = "USER_ORDER";

  //order_list 불러오기
  static Future<List<Order>> getOrder(String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_ORDER_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order List Get Response : ${response.body}');
      if (response.statusCode == 200) {
        List<Order> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //order_list 불러오기 고객
  static Future<List<Order>> getCusOrder(String user_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_CUS_ACTION;
      map['customer_id'] = user_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Customer Order List Get Response : ${response.body}');
      if (response.statusCode == 200) {
        List<Order> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //request_form 특정 order 정보 불러오기
  static Future<List<Order>> getEach_Order(String order_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_EACH_ORDER;
      map['order_id'] = order_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order List Get Response : ${response.body}');
      if (response.statusCode == 200) {
        List<Order> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //chat order list where user_id=user_id
  static Future<List<OrderChat>> getUserOrder(String userId) async {
    print(userId);
    try {
      var map = <String, dynamic>{};
      map['action'] = GET_USER_ORDER_ACTION;
      map['user_id'] = userId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get User Order Response : ${response.body}');
      if (response.statusCode == 200) {
        List<OrderChat> list = parseChatResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List> getUserOrderEstimate(String orderId) async {
    print(orderId);
    var url = Uri.parse('$homeURL/plus/chat_user_estimate.php');
    var result = await http.post(url, body: {
      "order_id": orderId,
    });
    print(result.body);

    Map<String, dynamic> body = json.decode(result.body);

    List<dynamic> profile = body['profile'];
    return profile;
  }

  static List<OrderChat> parseChatResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<OrderChat>((json) => OrderChat.fromJson(json)).toList();
  }

  static List<Order> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  }
}
