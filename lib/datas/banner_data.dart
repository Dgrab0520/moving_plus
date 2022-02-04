import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/banner_model.dart';

class Banner_Data extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_banner_select.php";
  static const BANNER_SELECT_ACTION = "BANNER_SELECT";
  static const BANNER_SUB_SELECT_ACTION = "BANNER_SUB_ACTION";

  List<Banners> bannerMain = [];
  List<Banners> bannerSub = [];
  var isMainLoading = false.obs;
  var isSubLoading = false.obs;

  getBanner_Main() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = BANNER_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Banners> list = parseResponse(response.body);
        bannerMain = list;
        isMainLoading.value = true;
        print(isMainLoading);
      }
    } catch (e) {
      print(e);
    }
  }

  getBanner_Sub() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = BANNER_SUB_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner_Sub Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Banners> list = parseResponse(response.body);
        bannerSub = list;
        isSubLoading.value = true;
        print(isSubLoading);
      }
    } catch (e) {
      print(e);
    }
  }

  static List<Banners> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Banners>((json) => Banners.fromJson(json)).toList();
  }
}
