import 'dart:convert';

import 'package:http/http.dart' as http;

class FindAccount {
  static const ROOT = "http://211.110.44.91/plus/plus_find_account.php";

  //아이디 찾기
  static Future<List<dynamic>> getId(String name, String phone) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "ID";
      map['name'] = name;
      map['phone'] = phone;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Find Id Response : ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body)['id'];
        return result;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  //비밀번호 찾기
  static Future<String> getPwd(String id, String phone) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "PWD";
      map['id'] = id;
      map['phone'] = phone;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Pro Find Pwd Response : ${response.body}');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}
