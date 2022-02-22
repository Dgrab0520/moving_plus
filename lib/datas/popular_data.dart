import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_popular.php";

  final _isPopularLoading = false.obs;
  set isPopularLoading(val) => _isPopularLoading.value = val;
  bool get isPopularLoading => _isPopularLoading.value;

  final _popular = <dynamic>[].obs;
  set popular(value) => _popular.value = value;
  List<dynamic> get popular => _popular;

  //자주 찾는 서비스 불러오기
  getPopular() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "MAIN";
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Main Popular Response : ${response.body}');

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        popular = jsonDecode(response.body);
        isPopularLoading = true;
      }
    } catch (e) {
      print(e);
      popular = <String>[];
      isPopularLoading = true;
    }
  }
}
