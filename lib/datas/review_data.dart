import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/review_model.dart';


class Review_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_review.php";
  static const SELECT_REVIEW_ACTION = "SELECT_REVIEW";

  static Future<List<Review>> getReview(String pro_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = SELECT_REVIEW_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Review Response : ${response.body}');
      if(200 == response.statusCode){
        List<Review> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }
  static List<Review> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Review>((json) => Review.fromJson(json)).toList();
  }
}

