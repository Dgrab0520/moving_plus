import 'package:http/http.dart' as http;

class OrderData {
  static const ROOT = "http://211.110.44.91/plus/plus_order_insert.php";
  static const UPDATE_ORDER_ACTION = "UPDATE_ORDER";  //request_estimate 기본 정보 저장



  //request_estimate 기본 정보 저장
  static Future<String> updateOrder(String order_id, String user_id, String user_name, String user_phone, String address, String address_detail, String space_type, String space_size) async {  //String order_id, String user_id, String user_name, String user_phone, String address, String address_detail, String space_type, String space_size
    try{
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
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Order Update Result : ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }

  //request_estimate 기본 정보 저장
  // static Future<String> updateOrder(String order_id) async {
  //   try{
  //     var map = Map<String, dynamic>();
  //     map['action'] = UPDATE_ORDER_ACTION;
  //     map['order_id'] = order_id;
  //     final response = await http.post(Uri.parse(ROOT), body: map);
  //     print('Order Update Result : ${response.body}');
  //     if(200 == response.statusCode){
  //       return response.body;
  //     }else{
  //       return "error";
  //     }
  //   }catch(e){
  //     return "error";
  //   }
  // }
}