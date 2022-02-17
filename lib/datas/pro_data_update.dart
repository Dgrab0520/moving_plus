import 'dart:io';

import 'package:http/http.dart' as http;

import 'chat_data.dart';

class ProDataUpdate {
  static const ROOT = "http://211.110.44.91/plus/plus_pro_update.php";

  static const PRO_UPDATE_ACTION = "PRO_UPDATE";

  //포트폴리오 업데이트
  static Future<String> updatePro(
      String pro_id,
      String intro,
      String pro_name,
      String service_type1,
      String service_type2,
      String service_type3,
      String service_type4,
      String service_type5,
      String pro_area1,
      String pro_area2,
      String pro_area3,
      String pro_career,
      String pro_pay) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "PRO_UPDATE";
      map['pro_id'] = pro_id;
      map['intro'] = intro;
      map['pro_name'] = pro_name;
      map['service_type1'] = service_type1;
      map['service_type2'] = service_type2;
      map['service_type3'] = service_type3;
      map['service_type4'] = service_type4;
      map['service_type5'] = service_type5;
      map['pro_area1'] = pro_area1;
      map['pro_area2'] = pro_area2;
      map['pro_area3'] = pro_area3;
      map['pro_career'] = pro_career;
      map['pro_pay'] = pro_pay;
      print(map);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print(response.reasonPhrase);
      print("Pro Update : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //프로필 이미지 변경
  static Future<String> changeProfileImage(File file) async {
    String imageName = getRandomString() + ".gif";
    print(controller.pro.value.pro_id);
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "CHANGE_IMAGE";
      request.fields['image'] = imageName;
      request.fields['pro_id'] = controller.pro.value.pro_id;
      request.files
          .add(await http.MultipartFile.fromPath("profileImage", file.path));
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Profile Image Response : ${response.body}");
      if (response.statusCode == 200) {
        controller.setProfile(imageName);
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  //비밀번호 변경
  static Future<String> changePWD(String pwd) async {
    print(controller.pro.value.pro_id);
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "CHANGE_PWD";
      request.fields['pwd'] = pwd;
      request.fields['pro_id'] = controller.pro.value.pro_id;
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Profile Password Response : ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }
}
