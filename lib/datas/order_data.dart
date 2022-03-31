import 'package:http/http.dart' as http;

class OrderData {
  static const ROOT = "http://211.110.44.91/plus/plus_order_insert.php";
  static const UPDATE_ORDER_ACTION = "UPDATE_ORDER"; //request_estimate 기본 정보 저장
  static const UPDATE_DETAIL_ACTION =
      "UPDATE_DETAIL"; //request_estimate Detail 정보 저장
  static const DELETE_ORDER_ACTION = "DELETE_ORDER"; //customer order delete

  //request_estimate 기본 정보 저장
  static Future<String> updateOrder(
      String order_id,
      String user_id,
      String user_name,
      String user_phone,
      String address,
      String address_detail,
      String space_type,
      String space_size,
      String service_type) async {
    //String order_id, String user_id, String user_name, String user_phone, String address, String address_detail, String space_type, String space_size
    try {
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_ORDER_ACTION;
      map['order_id'] = order_id;
      map['user_id'] = user_id;
      map['user_name'] = user_name;
      map['user_phone'] = user_phone;
      map['address'] = address;
      map['address_detail'] = address_detail;
      map['space_type'] = space_type;
      map['space_size'] = space_size;
      map['service_type'] = service_type;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order Update Result : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //request_estimate2 detail 정보 저장
  static Future<String> updateDetail(
      String order_id,
      String date_start,
      String date_end,
      String time,
      String item1,
      String item2,
      String item3,
      String item4,
      String item5,
      String request_detail) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_DETAIL_ACTION;
      map['order_id'] = order_id;
      map['date_start'] = date_start;
      map['date_end'] = date_end;
      map['time'] = time;
      map['item1'] = item1;
      map['item2'] = item2;
      map['item3'] = item3;
      map['item4'] = item4;
      map['item5'] = item5;

      map['request_detail'] = request_detail;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order Detail Update : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> deleteOrder(String order_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = DELETE_ORDER_ACTION;
      map['order_id'] = order_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Delete Order Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> disableOrder(String order_id) async {
    print(order_id);
    try {
      var map = <String, dynamic>{};
      map['action'] = "DISABLE_ORDER";
      map['order_id'] = order_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Disable Order Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
