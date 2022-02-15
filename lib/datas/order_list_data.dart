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
  static const GET_ORDER_CHAT_ACTION = "ORDER_CHAT";
  static const UPDATE_INDEX_ACTION = "UPDATE_INDEX";

  //Pro order_list 불러오기
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

  //Customer order_list 불러오기
  static Future<List<Order>> get_CusOrder(String customer_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_CUS_ACTION;
      map['customer_id'] = customer_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order Customer List Response : ${response.body}');
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
      var map = <String, dynamic>{};
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

  //특정 orderId OrderChat 불러오기
  static Future<OrderChat?> getOrderChat(String orderId) async {
    print(orderId);
    try {
      var map = <String, dynamic>{};
      map['action'] = GET_ORDER_CHAT_ACTION;
      map['order_id'] = orderId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get User OrderChat Response : ${response.body}');
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        OrderChat orderChat =
            jsonResponse.map((model) => OrderChat.fromJson(model)).toList()[0];
        print(orderChat);
        return orderChat;
      } else {
        return null;
      }
    } catch (e) {
      print("exception : $e");
      return null;
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

  static Future<String> updateIndex(String order_id, String index_value) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_INDEX_ACTION;
      map['order_id'] = order_id;
      map['index_value'] = index_value;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Update Index Respnse ; ${response.body}");
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
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
