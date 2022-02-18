import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moving_plus/models/review_model.dart';

class Review_Data {
  static const ROOT = "http://211.110.44.91/plus/plus_review.php";
  static const SELECT_REVIEW_ACTION = "SELECT_REVIEW";

  static Future<List<Review>> getReview(String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_REVIEW_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Review Response : ${response.body}');
      if (200 == response.statusCode) {
        List<Review> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //리뷰 입력
  static Future<String> putReview(
      String callerName, List<dynamic> receiverName, String alarmType,
      {String? order_id, String? mainType}) async {
    print(jsonEncode(receiverName));
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = WRITE_ACTION;
      request.fields['callerName'] = callerName;
      request.fields['receiverName'] = jsonEncode(receiverName);
      request.fields['alarmType'] = alarmType;
      if (order_id != null) {
        request.fields['order_id'] = order_id;
        request.fields['mainType'] = mainType!;
      }
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Alarm Write Response : ${response.body}");
      if (response.statusCode == 200) {
        List<String> result = [response.body];
        return result;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static List<Review> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Review>((json) => Review.fromJson(json)).toList();
  }
}
