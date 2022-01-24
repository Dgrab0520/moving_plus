import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/order_model.dart';

class OrderList_Data{
  static const ROOT = "http://211.110.44.91/plus/select_order.php";
  static const GET_ORDER_ACTION = "GET_ORDER";
  static const GET_EACH_ORDER = "EACH_ORDER";

  //order_list 불러오기
  static Future<List<Order>> getOrder() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_ORDER_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order List Get Response : ${response.body}');
      if(response.statusCode == 200){
        List<Order> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  //request_form 특정 order 정보 불러오기
  static Future<List<Order>> getEach_Order(String order_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_EACH_ORDER;
      map['order_id'] = order_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order List Get Response : ${response.body}');
      if(response.statusCode == 200){
        List<Order> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  static List<Order> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  }


}


